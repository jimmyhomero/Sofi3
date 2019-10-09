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
import persistencia.modelos.Plan;
import persistencia.modelos.SriFormasPago;

/**
 *
 * @author USUARIO
 */
public class SriFormasPagoJpaController implements Serializable {

    public SriFormasPagoJpaController(EntityManagerFactory emf) {
        this.emf = emf;
    }
    private EntityManagerFactory emf = null;

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    public void create(SriFormasPago sriFormasPago) {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            em.persist(sriFormasPago);
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void edit(SriFormasPago sriFormasPago) throws NonexistentEntityException, Exception {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            sriFormasPago = em.merge(sriFormasPago);
            em.getTransaction().commit();
        } catch (Exception ex) {
            String msg = ex.getLocalizedMessage();
            if (msg == null || msg.length() == 0) {
                Integer id = sriFormasPago.getCodigo();
                if (findSriFormasPago(id) == null) {
                    throw new NonexistentEntityException("The sriFormasPago with id " + id + " no longer exists.");
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
            SriFormasPago sriFormasPago;
            try {
                sriFormasPago = em.getReference(SriFormasPago.class, id);
                sriFormasPago.getCodigo();
            } catch (EntityNotFoundException enfe) {
                throw new NonexistentEntityException("The sriFormasPago with id " + id + " no longer exists.", enfe);
            }
            em.remove(sriFormasPago);
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public List<SriFormasPago> findSriFormasPagoEntities() {
        return findSriFormasPagoEntities(true, -1, -1);
    }

    public List<SriFormasPago> findSriFormasPagoEntities(int maxResults, int firstResult) {
        return findSriFormasPagoEntities(false, maxResults, firstResult);
    }

    private List<SriFormasPago> findSriFormasPagoEntities(boolean all, int maxResults, int firstResult) {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(SriFormasPago.class));
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

    public SriFormasPago findSriFormaPagoBynombre(String  formapago) {
        EntityManager em = getEntityManager();
        try {
            //return em.createNamedQuery("Plan.findByDescripcion");// ..find(Plan.class, id);
            Query q = em.createNamedQuery("SriFormasPago.findByFormaPago");
              q.setParameter("formaPago",formapago);
            q.getSingleResult();
            return ((SriFormasPago) q.getSingleResult());
        } finally {
            em.close();
        }
    }
    public SriFormasPago findSriFormasPago(Integer id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(SriFormasPago.class, id);
        } finally {
            em.close();
        }
    }

    public int getSriFormasPagoCount() {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            Root<SriFormasPago> rt = cq.from(SriFormasPago.class);
            cq.select(em.getCriteriaBuilder().count(rt));
            Query q = em.createQuery(cq);
            return ((Long) q.getSingleResult()).intValue();
        } finally {
            em.close();
        }
    }

    public DefaultTableModel getTableModelSRIFormasPago() {
        List<SriFormasPago> lista = new ArrayList();
        DefaultTableModel modelo = null;

        String[] titulos
                = {"CODIGO", "ID", "FORMA DE PAGO"};
        String[] registros = new String[4];
        modelo = new DefaultTableModel(null, titulos) {
            @Override
            public boolean isCellEditable(int row, int column) {
                // make read only fields except column 0,13,14
                //  return column == 0 || column == 13 || column == 14;
                return false;
            }
        };
        lista = findSriFormasPagoEntities();
        for (SriFormasPago l : lista) {
            registros[0] = l.getCodigo().toString();
            registros[1] = l.getFormaPago();
            registros[2] = l.getId();
            modelo.addRow(registros);
        }

        return modelo;
    }
}
