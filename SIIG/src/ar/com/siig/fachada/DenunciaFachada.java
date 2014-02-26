package ar.com.siig.fachada;

import java.util.ArrayList;
import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import ar.com.siig.dao.DenunciaDAO;
import ar.com.siig.dto.DenunciaDTO;
import ar.com.siig.negocio.Denuncia;
import ar.com.siig.negocio.DenunciaHacienda;
import ar.com.siig.negocio.DenunciaPerros;
import ar.com.siig.negocio.TipoDeDenuncia;
import ar.com.siig.negocio.exception.NegocioException;
import ar.com.siig.providers.ProviderDTO;
import ar.com.siig.providers.ProviderDominio;

@Transactional(rollbackFor = { Throwable.class })
public class DenunciaFachada {

	private DenunciaDAO denunciaDAO;

	public DenunciaFachada() {
	}

	public DenunciaFachada(DenunciaDAO laDenunciaDAO) {
		this.denunciaDAO = laDenunciaDAO;
	}

	public List<Denuncia> getDenuncias() {
		return denunciaDAO.getDenuncias();
	}

	public Denuncia getDenunciaPorId(Long id) {
		return denunciaDAO.getDenunciaPorId(id);
	}

	public Denuncia altaDenuncia(DenunciaDTO denunciaDTO)
			throws NegocioException {
		List<TipoDeDenuncia> tiposDeDenuncia = denunciaDAO
				.getTiposDeDenuncia(denunciaDTO);
		if (denunciaDTO.getNumeroDeLlamado() == null
				|| denunciaDTO.getNumeroDeLlamado() == 0) {
			Integer ultimoNumeroDeDenuncia = denunciaDAO
					.getUltimoNumeroDeDenuncia() + 1;
			denunciaDTO.setNumeroDeDenuncia(ultimoNumeroDeDenuncia);
		}

		Denuncia denuncia = ProviderDominio.getDenuncia(denunciaDTO);

		denuncia.setAvistajeDePerros(denunciaDTO.getAvistajePerros());
		for (DenunciaPerros denunciaPerros : denunciaDTO.getAvistajePerros()) {
			denunciaPerros.setCapturaAvistaje("AVISTAJE");
			denunciaPerros.setDenuncia(denuncia);
		}

		denuncia.setCapturaDePerros(denunciaDTO.getCapturaPerros());
		for (DenunciaPerros denunciaPerros : denunciaDTO.getCapturaPerros()) {
			denunciaPerros.setCapturaAvistaje("CAPTURA");
			denunciaPerros.setDenuncia(denuncia);
		}

		denuncia.setDañoEnHacienda(denunciaDTO.getDañosHacienda());
		for (DenunciaHacienda denunciaHacienda : denunciaDTO.getDañosHacienda()) {
			denunciaHacienda.setDañosMuerte("DAÑOS");
			denunciaHacienda.setDenuncia(denuncia);
		}

		denuncia.setMuerteEnHacienda(denunciaDTO.getMuertesHacienda());
		for (DenunciaHacienda denunciaHacienda : denunciaDTO
				.getMuertesHacienda()) {
			denunciaHacienda.setDañosMuerte("MUERTE");
			denunciaHacienda.setDenuncia(denuncia);
		}

		denuncia.setTipoDeDenuncias(tiposDeDenuncia);
		return denunciaDAO.alta_modficacion_Denuncia(denuncia,
				denunciaDTO.getProductorId());
	}

	public List<DenunciaDTO> getDenunciaesDTO() {

		List<DenunciaDTO> denunciaesDTO = new ArrayList<DenunciaDTO>();
		List<Denuncia> denunciaes = denunciaDAO.getDenuncias();

		for (Denuncia denuncia : denunciaes) {
			denunciaesDTO.add(ProviderDTO.getDenunciaDTO(denuncia));
		}

		return denunciaesDTO;
	}

	public DenunciaDTO getDenunciaDTOPorId(Long id) {

		Denuncia denuncia = denunciaDAO.getDenunciaPorId(id);
		return ProviderDTO.getDenunciaDTO(denuncia);
	}

	public List<TipoDeDenuncia> getTiposDeDenuncia() {
		return denunciaDAO.getTiposDeDenuncia();
	}

	public Integer getUltimoNumeroDeDenuncia() {
		return denunciaDAO.getUltimoNumeroDeDenuncia();
	}

	public boolean existeDenuncia(Integer numeroDeDenuncia,
			Integer numeroDeLlamado, Long id) {
		return denunciaDAO
				.existeDenuncia(numeroDeDenuncia, numeroDeLlamado, id);
	}
}
