/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controle;

import java.util.List;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;


public class Cadastro {
    static private Session ses = NovoHibernateUtil.getSessionFactory().openSession();
    
    //metodo para contultar todos de uma classe
    public List consultaTodos(Class classe){
        return ses.createCriteria(classe).list();
    }
    
    public Object consultaObjeto(Class classe,String prop, Object valor){
        return ses.createCriteria(classe).add(Restrictions.eq(prop, valor)).setMaxResults(1).uniqueResult();
    }
    
    //metodo para salvar objeto na base
    public void salvar(Object obj){
        Transaction tr = ses.beginTransaction();
        ses.saveOrUpdate(obj);
        tr.commit();
    }
    
    
    
    
    
}

