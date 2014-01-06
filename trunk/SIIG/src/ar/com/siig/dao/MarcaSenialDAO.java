package ar.com.siig.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import ar.com.siig.enums.TipoMarcaSenial;
import ar.com.siig.negocio.CanonMarcaSenial;
import ar.com.siig.negocio.Marca;
import ar.com.siig.negocio.Productor;
import ar.com.siig.negocio.Senial;
import ar.com.siig.utils.DateUtils;

public class MarcaSenialDAO extends HibernateDaoSupport {

	public List<CanonMarcaSenial> recuperarCanonMarcaSenial(){
		
		Criteria criteria = getSession().createCriteria(CanonMarcaSenial.class);
		List<CanonMarcaSenial> lista = criteria.list();
		
		return lista;
	}	
	
	public CanonMarcaSenial recuperarCanonMarcaSenial(Long id){
		
		return (CanonMarcaSenial) getHibernateTemplate().get(CanonMarcaSenial.class, id);
	}
	
	public CanonMarcaSenial recuperarCanonMarcaSenial(String tipo){
		
		Criteria criteria = getSession().createCriteria(CanonMarcaSenial.class);
		criteria.add(Restrictions.eq("tipo", tipo));
		List<CanonMarcaSenial> lista = criteria.list();
		
		return lista.get(0);
	}	
	
	public String registrarPagoBoletaDeposito(Long idMarcaSenial, String fechaPago, String tipo){
	
		if(tipo.equalsIgnoreCase(TipoMarcaSenial.Marca.getName())){
			Marca marca = (Marca)getHibernateTemplate().get(Marca.class, idMarcaSenial);
			marca.getBoletaDeposito().setFechaPago(DateUtils.dateFromString(fechaPago,"dd/MM/yyyy"));
			
			this.getHibernateTemplate().saveOrUpdate(marca);
			this.getHibernateTemplate().flush();
			this.getHibernateTemplate().clear();			
			
		}else{
			Senial senial = (Senial)getHibernateTemplate().get(Senial.class, idMarcaSenial);
			senial.getBoletaDeposito().setFechaPago(DateUtils.dateFromString(fechaPago,"dd/MM/yyyy"));	
			
			this.getHibernateTemplate().saveOrUpdate(senial);
			this.getHibernateTemplate().flush();
			this.getHibernateTemplate().clear();			
		}
				
		return fechaPago;
	}
	
	public Marca getMarcaDTO(Long idProductor){
		
		Productor productor = (Productor)getHibernateTemplate().get(Productor.class, idProductor);
		return productor.getUltimaMarca();
		
	}
	
	public Senial getSenialDTO(Long idProductor){
		
		Productor productor = (Productor)getHibernateTemplate().get(Productor.class, idProductor);
		return productor.getUltimaSenial();
		
	}		
}
