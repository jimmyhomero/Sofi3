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
import persistencia.modelos.Formaspagoc;
import persistencia.modelos.SriFormasPago;

/**
 *
 * @author USUARIO
 */
public class FormaspagocJpaController implements Serializable {

    public FormaspagocJpaController(EntityManagerFactory emf) {
        this.emf = emf;
    }
    private EntityManagerFactory emf = null;

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    
    public Formaspagoc create(Formaspagoc formaspagoc) {
        
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            SriFormasPago sriFormaPagoCodigo = formaspagoc.getSriFormaPagoCodigo();
            if (sriFormaPagoCodigo != null) {
                sriFormaPagoCodigo = em.getReference(sriFormaPagoCodigo.getClass(), sriFormaPagoCodigo.getCodigo());
                formaspagoc.setSriFormaPagoCodigo(sriFormaPagoCodigo);
            }
            em.persist(formaspagoc);
            if (sriFormaPagoCodigo != null) {
                sriFormaPagoCodigo.getFormaspagocList().add(formaspagoc);
                sriFormaPagoCodigo = em.merge(sriFormaPagoCodigo);
            }
            em.getTransaction().commit();
            return formaspagoc;
        }catch (Exception e) {
            em.getTransaction().rollback();
            System.err.println("SSERRORO: "+e);
            return null;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void edit(Formaspagoc formaspagoc) throws NonexistentEntityException, Exception {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            Formaspagoc persistentFormaspagoc = em.find(Formaspagoc.class, formaspagoc.getCodigo());
            SriFormasPago sriFormaPagoCodigoOld = persistentFormaspagoc.getSriFormaPagoCodigo();
            SriFormasPago sriFormaPagoCodigoNew = formaspagoc.getSriFormaPagoCodigo();
            if (sriFormaPagoCodigoNew != null) {
                sriFormaPagoCodigoNew = em.getReference(sriFormaPagoCodigoNew.getClass(), sriFormaPagoCodigoNew.getCodigo());
                formaspagoc.setSriFormaPagoCodigo(sriFormaPagoCodigoNew);
            }
            formaspagoc = em.merge(formaspagoc);
            if (sriFormaPagoCodigoOld != null && !sriFormaPagoCodigoOld.equals(sriFormaPagoCodigoNew)) {
                sriFormaPagoCodigoOld.getFormaspagocList().remove(formaspagoc);
                sriFormaPagoCodigoOld = em.merge(sriFormaPagoCodigoOld);
            }
            if (sriFormaPagoCodigoNew != null && !sriFormaPagoCodigoNew.equals(sriFormaPagoCodigoOld)) {
                sriFormaPagoCodigoNew.getFormaspagocList().add(formaspagoc);
                sriFormaPagoCodigoNew = em.merge(sriFormaPagoCodigoNew);
            }
            em.getTransaction().commit();
        } catch (Exception ex) {
            String msg = ex.getLocalizedMessage();
            if (msg == null || msg.length() == 0) {
                Integer id = formaspagoc.getCodigo();
                if (findFormaspagoc(id) == null) {
                    throw new NonexistentEntityException("The formaspagoc with id " + id + " no longer exists.");
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
            Formaspagoc formaspagoc;
            try {
                formaspagoc = em.getReference(Formaspagoc.class, id);
                formaspagoc.getCodigo();
            } catch (EntityNotFoundException enfe) {
                throw new NonexistentEntityException("The formaspagoc with id " + id + " no longer exists.", enfe);
            }
            SriFormasPago sriFormaPagoCodigo = formaspagoc.getSriFormaPagoCodigo();
            if (sriFormaPagoCodigo != null) {
                sriFormaPagoCodigo.getFormaspagocList().remove(formaspagoc);
                sriFormaPagoCodigo = em.merge(sriFormaPagoCodigo);
            }
            em.remove(formaspagoc);
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public List<Formaspagoc> findFormaspagocEntities() {
        return findFormaspagocEntities(true, -1, -1);
    }

    public List<Formaspagoc> findFormaspagocEntities(int maxResults, int firstResult) {
        return findFormaspagocEntities(false, maxResults, firstResult);
    }

    private List<Formaspagoc> findFormaspagocEntities(boolean all, int maxResults, int firstResult) {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(Formaspagoc.class));
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

    public Formaspagoc findFormaspagoc(Integer id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(Formaspagoc.class, id);
        } finally {
            em.close();
        }
    }

    public int getFormaspagocCount() {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            Root<Formaspagoc> rt = cq.from(Formaspagoc.class);
            cq.select(em.getCriteriaBuilder().count(rt));
            Query q = em.createQuery(cq);
            return ((Long) q.getSingleResult()).intValue();
        } finally {
            em.close();
        }
    }
    
}
