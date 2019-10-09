/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package persistencia.controllers;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Query;
import javax.persistence.EntityNotFoundException;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import javax.swing.table.DefaultTableModel;
import persistencia.controllers.exceptions.NonexistentEntityException;
import persistencia.controllers.exceptions.PreexistingEntityException;
import persistencia.modelos.Plan;

/**
 *
 * @author USUARIO
 */
public class PlanJpaController implements Serializable {

    public PlanJpaController(EntityManagerFactory emf) {
        this.emf = emf;
    }
    private EntityManagerFactory emf = null;

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    public void create(Plan plan) throws PreexistingEntityException, Exception {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            em.persist(plan);
            em.getTransaction().commit();
        } catch (Exception ex) {
            if (findPlan(plan.getCodigo()) != null) {
                throw new PreexistingEntityException("Plan " + plan + " already exists.", ex);
            }
            throw ex;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void edit(Plan plan) throws NonexistentEntityException, Exception {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            plan = em.merge(plan);
            em.getTransaction().commit();
        } catch (Exception ex) {
            String msg = ex.getLocalizedMessage();
            if (msg == null || msg.length() == 0) {
                Integer id = plan.getCodigo();
                if (findPlan(id) == null) {
                    throw new NonexistentEntityException("The plan with id " + id + " no longer exists.");
                }
            }
            throw ex;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void destroy(Integer id) throws NonexistentEntityException {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            Plan plan;
            try {
                plan = em.getReference(Plan.class, id);
                plan.getCodigo();
            } catch (EntityNotFoundException enfe) {
                throw new NonexistentEntityException("The plan with id " + id + " no longer exists.", enfe);
            }
            em.remove(plan);
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public List<Plan> findPlanEntities() {
        return findPlanEntities(true, -1, -1);
    }

    public List<Plan> findPlanEntities(int maxResults, int firstResult) {
        return findPlanEntities(false, maxResults, firstResult);
    }

    private List<Plan> findPlanEntities(boolean all, int maxResults, int firstResult) {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(Plan.class));
            Query q = em.createQuery(cq);
            if (!all) {
                q.setMaxResults(maxResults);
                q.setFirstResult(firstResult);
            }
            return q.getResultList();
        } finally {
            em.close();
        }
    }

    public Plan findPlan(Integer id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(Plan.class, id);
        } finally {
            em.close();
        }
    }
public Plan findCuentaByDescripcion(String  cuenta) {
        EntityManager em = getEntityManager();
        try {
            //return em.createNamedQuery("Plan.findByDescripcion");// ..find(Plan.class, id);
            Query q = em.createNamedQuery("Plan.findByDescripcion");
            q.setParameter("descripcion",cuenta);
            q.getSingleResult();
            return ((Plan) q.getSingleResult());
        } finally {
            em.close();
        }
    }
    public int getPlanCount() {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            Root<Plan> rt = cq.from(Plan.class);
            cq.select(em.getCriteriaBuilder().count(rt));
            Query q = em.createQuery(cq);
            return ((Long) q.getSingleResult()).intValue();
        } finally {
            em.close();
        }
    }

    public DefaultTableModel getplanCuentas() {
        List<Plan> lista = new ArrayList();
        DefaultTableModel modelo = null;

        String[] titulos
                = {"CODIGO", "CUENTA","PERTENECE A", "CUENTA/DET", "SALDO"};
        String[] registros = new String[10];
        modelo = new DefaultTableModel(null, titulos) {
            @Override
            public boolean isCellEditable(int row, int column) {
                // make read only fields except column 0,13,14
                //  return column == 0 || column == 13 || column == 14;
                return false;
            }
        };
        lista = findPlanEntities();
        for (Plan l : lista) {
            registros[0] = l.getCodigoCuenta();
            registros[1] = l.getDescripcion();
            registros[2] = l.getPertenece();
            if (l.getTipo()) {
                registros[3] = "DETALLE";
            } else {
                registros[3] = "CEUNTA";
            }

            modelo.addRow(registros);
        }

        return modelo;
    }
}
