/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package persistencia.controllers;

import java.io.Serializable;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Query;
import javax.persistence.EntityNotFoundException;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import persistencia.controllers.exceptions.NonexistentEntityException;
import persistencia.modelos.Formaspagov;
import persistencia.modelos.SriFormasPago;

/**
 *
 * @author USUARIO
 */
public class FormaspagovJpaController implements Serializable {

    public FormaspagovJpaController(EntityManagerFactory emf) {
        this.emf = emf;
    }
    private EntityManagerFactory emf = null;

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    public void create(Formaspagov formaspagov) {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            SriFormasPago sriFormaPagoCodigo = formaspagov.getSriFormaPagoCodigo();
            if (sriFormaPagoCodigo != null) {
                sriFormaPagoCodigo = em.getReference(sriFormaPagoCodigo.getClass(), sriFormaPagoCodigo.getCodigo());
                formaspagov.setSriFormaPagoCodigo(sriFormaPagoCodigo);
            }
            em.persist(formaspagov);
            if (sriFormaPagoCodigo != null) {
                sriFormaPagoCodigo.getFormaspagovList().add(formaspagov);
                sriFormaPagoCodigo = em.merge(sriFormaPagoCodigo);
            }
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void edit(Formaspagov formaspagov) throws NonexistentEntityException, Exception {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            Formaspagov persistentFormaspagov = em.find(Formaspagov.class, formaspagov.getCodigo());
            SriFormasPago sriFormaPagoCodigoOld = persistentFormaspagov.getSriFormaPagoCodigo();
            SriFormasPago sriFormaPagoCodigoNew = formaspagov.getSriFormaPagoCodigo();
            if (sriFormaPagoCodigoNew != null) {
                sriFormaPagoCodigoNew = em.getReference(sriFormaPagoCodigoNew.getClass(), sriFormaPagoCodigoNew.getCodigo());
                formaspagov.setSriFormaPagoCodigo(sriFormaPagoCodigoNew);
            }
            formaspagov = em.merge(formaspagov);
            if (sriFormaPagoCodigoOld != null && !sriFormaPagoCodigoOld.equals(sriFormaPagoCodigoNew)) {
                sriFormaPagoCodigoOld.getFormaspagovList().remove(formaspagov);
                sriFormaPagoCodigoOld = em.merge(sriFormaPagoCodigoOld);
            }
            if (sriFormaPagoCodigoNew != null && !sriFormaPagoCodigoNew.equals(sriFormaPagoCodigoOld)) {
                sriFormaPagoCodigoNew.getFormaspagovList().add(formaspagov);
                sriFormaPagoCodigoNew = em.merge(sriFormaPagoCodigoNew);
            }
            em.getTransaction().commit();
        } catch (Exception ex) {
            String msg = ex.getLocalizedMessage();
            if (msg == null || msg.length() == 0) {
                Integer id = formaspagov.getCodigo();
                if (findFormaspagov(id) == null) {
                    throw new NonexistentEntityException("The formaspagov with id " + id + " no longer exists.");
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
            Formaspagov formaspagov;
            try {
                formaspagov = em.getReference(Formaspagov.class, id);
                formaspagov.getCodigo();
            } catch (EntityNotFoundException enfe) {
                throw new NonexistentEntityException("The formaspagov with id " + id + " no longer exists.", enfe);
            }
            SriFormasPago sriFormaPagoCodigo = formaspagov.getSriFormaPagoCodigo();
            if (sriFormaPagoCodigo != null) {
                sriFormaPagoCodigo.getFormaspagovList().remove(formaspagov);
                sriFormaPagoCodigo = em.merge(sriFormaPagoCodigo);
            }
            em.remove(formaspagov);
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public List<Formaspagov> findFormaspagovEntities() {
        return findFormaspagovEntities(true, -1, -1);
    }

    public List<Formaspagov> findFormaspagovEntities(int maxResults, int firstResult) {
        return findFormaspagovEntities(false, maxResults, firstResult);
    }

    private List<Formaspagov> findFormaspagovEntities(boolean all, int maxResults, int firstResult) {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(Formaspagov.class));
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

    public Formaspagov findFormaspagov(Integer id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(Formaspagov.class, id);
        } finally {
            em.close();
        }
    }

    public int getFormaspagovCount() {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            Root<Formaspagov> rt = cq.from(Formaspagov.class);
            cq.select(em.getCriteriaBuilder().count(rt));
            Query q = em.createQuery(cq);
            return ((Long) q.getSingleResult()).intValue();
        } finally {
            em.close();
        }
    }
    
}
