package ar.com.siig.dao;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Conjunction;
import org.hibernate.criterion.Expression;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import ar.com.siig.dto.DenunciaDTO;
import ar.com.siig.negocio.Denuncia;
import ar.com.siig.negocio.Entidad;
import ar.com.siig.negocio.TipoDeDenuncia;
import ar.com.siig.negocio.exception.NegocioException;
import ar.com.siig.utils.Constantes;

public class DenunciaDAO extends HibernateDaoSupport {

	public List<Denuncia> getDenuncias() {
		return getHibernateTemplate().loadAll(Denuncia.class);
	}

	public Denuncia getDenunciaPorId(Long id) {
		return (Denuncia) getHibernateTemplate().get(Denuncia.class, id);
	}

	public boolean existeDenuncia(Integer numeroDeDenuncia,
			Integer numeroDeLlamado, Long id) {
		Criteria criteria = getSession().createCriteria(Denuncia.class);
		Conjunction conj = Restrictions.conjunction();
		conj.add(Restrictions.eq("numeroDeDenuncia", numeroDeDenuncia));
		conj.add(Restrictions.eq("numeroDeLlamado", numeroDeLlamado));
		if (id != null) {
			conj.add(Restrictions.ne("id", id));
		}
		criteria.add(conj);

		List<Denuncia> denuncias = criteria.list();
		return (denuncias.size() > 0);
	}

	public Denuncia alta_modficacion_Denuncia(Denuncia denuncia,
			Long productorId) throws NegocioException {

		denuncia.setProductor((Entidad) this.getHibernateTemplate().get(
				Entidad.class, productorId));
		if (existeDenuncia(denuncia.getNumeroDeDenuncia(),
				denuncia.getNumeroDeLlamado(), denuncia.getId())) {
			throw new NegocioException(Constantes.EXISTE_DENUNCIA);
		}
		this.getHibernateTemplate().saveOrUpdate(denuncia);
		this.getHibernateTemplate().flush();
		this.getHibernateTemplate().clear();

		return denuncia;
	}

	public List<TipoDeDenuncia> getTiposDeDenuncia() {
		return getHibernateTemplate().loadAll(TipoDeDenuncia.class);
	}

	public List<TipoDeDenuncia> getTiposDeDenuncia(DenunciaDTO denunciaDTO) {
		List<TipoDeDenuncia> tiposDeDenuncias = new ArrayList<TipoDeDenuncia>();
		for (String tipoDeDenuncia : denunciaDTO.getTiposDeDenuncia()) {
			if (tipoDeDenuncia != null) {// )&& tipoDeDenuncia. != null) {
				tiposDeDenuncias
						.add((TipoDeDenuncia) getHibernateTemplate().get(
								TipoDeDenuncia.class,
								Long.valueOf(tipoDeDenuncia)));
			}
		}
		return tiposDeDenuncias;
	}

	public Integer getUltimoNumeroDeDenuncia() {
		Criteria criteria = getSession().createCriteria(Denuncia.class);
		criteria.setProjection(Projections.max("numeroDeDenuncia"));
		Integer resul = (Integer) criteria.uniqueResult();
		if (resul == null) {
			return 0;
		}
		return resul;
	}

	public List<Denuncia> recuperarDenuncias(Long idProductor, Date desde,
			Date hasta) {
		Criteria criteria = getSession().createCriteria(Denuncia.class);
		criteria.add(Restrictions.eq("productor.id", idProductor));
		if (desde != null) {
			criteria.add(Expression.ge("desde", desde));
		}
		if (hasta != null) {
			criteria.add(Expression.le("hasta", hasta));
		}
		List<Denuncia> denuncias = criteria.list();
		return denuncias;
	}
}
