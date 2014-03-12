package ar.com.siig.struts.actions;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.springframework.web.context.WebApplicationContext;

import ar.com.siig.dto.EntidadDTO;
import ar.com.siig.enums.Edad;
import ar.com.siig.enums.Sexo;
import ar.com.siig.enums.Tamano;
import ar.com.siig.enums.TipoDeDenunciaEnum;
import ar.com.siig.fachada.DenunciaFachada;
import ar.com.siig.fachada.EntidadFachada;
import ar.com.siig.negocio.Denuncia;
import ar.com.siig.negocio.TipoDeDenuncia;
import ar.com.siig.negocio.exception.NegocioException;
import ar.com.siig.struts.actions.forms.DenunciaForm;
import ar.com.siig.struts.utils.Validator;
import ar.com.siig.utils.Constantes;
import ar.com.siig.utils.MyLogger;

public class DenunciaAction extends ValidadorAction {

	public ActionForward initAltaDenuncia(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String strForward = "exitoInitAltaDenuncia";
		try {

			// reset el form
			form = new DenunciaForm();
			request.setAttribute("denunciaForm", form);

			WebApplicationContext ctx = getWebApplicationContext();
			DenunciaFachada denunciaFachada = (DenunciaFachada) ctx
					.getBean("denunciaFachada");
			EntidadFachada entidadFachada = (EntidadFachada) ctx
					.getBean("entidadFachada");

			List<TipoDeDenuncia> tiposDeDenuncias = denunciaFachada
					.getTiposDeDenuncia();
			request.setAttribute("tipoDenuncias", tiposDeDenuncias);

			List<EntidadDTO> productores = entidadFachada.getProductoresDTO();
			request.setAttribute("productores", productores);

			Integer numeroDeDenuncia = denunciaFachada
					.getUltimoNumeroDeDenuncia() + 1;
			request.setAttribute("numeroDeDenuncia", numeroDeDenuncia);

			List<TipoDeDenunciaEnum> tiposDeDenunciasEnum = new ArrayList<TipoDeDenunciaEnum>();
			tiposDeDenunciasEnum.add(TipoDeDenunciaEnum.PERROS);
			tiposDeDenunciasEnum.add(TipoDeDenunciaEnum.ROBO);
			tiposDeDenunciasEnum.add(TipoDeDenunciaEnum.OTRO);
			request.setAttribute("tiposDeDenunciasEnum", tiposDeDenunciasEnum);

			List<Sexo> sexos = new ArrayList<Sexo>();
			sexos.add(Sexo.MACHO);
			sexos.add(Sexo.HEMBRA);
			sexos.add(Sexo.INDEFINIDO);
			request.setAttribute("sexos", sexos);

			List<Tamano> tamanos = new ArrayList<Tamano>();
			tamanos.add(Tamano.CHICO);
			tamanos.add(Tamano.GRANDE);
			tamanos.add(Tamano.MEDIANO);
			tamanos.add(Tamano.INDEFINIDO);
			request.setAttribute("tamanos", tamanos);

			List<Edad> edades = new ArrayList<Edad>();
			edades.add(Edad.ADULTO);
			edades.add(Edad.CACHORRO);
			edades.add(Edad.INDEFINIDO);
			request.setAttribute("edades", edades);

		} catch (Throwable t) {
			MyLogger.logError(t);
			request.setAttribute("error", "Error Inesperado");
			strForward = "error";
		}
		return mapping.findForward(strForward);
	}

	public ActionForward altaDenuncia(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		String strForward = "exitoAltaDenuncia";
		try {
			DenunciaForm denunciaForm = (DenunciaForm) form;
			WebApplicationContext ctx = getWebApplicationContext();

			// valido nuevamente por seguridad.
			if (!validarDenunciaForm(new StringBuffer(), denunciaForm)) {
				throw new Exception("Error de Seguridad");
			}

			DenunciaFachada denunciaFachada = (DenunciaFachada) ctx
					.getBean("denunciaFachada");
			Denuncia denuncia = denunciaFachada.altaDenuncia(denunciaForm
					.getDenunciaDTO());
			if (denuncia.getNumeroDeDenuncia() > 0) {
				request.setAttribute("exitoGrabado",
						Constantes.EXITO_ALTA_DENUNCIA.replace("#", denuncia
								.getNumeroDeDenuncia().toString()));
			}
			if (denuncia.getNumeroDeLlamado() > 0) {
				request.setAttribute("exitoGrabado",
						Constantes.EXITO_ALTA_DENUNCIA_LLAMADO.replace("#",
								denuncia.getNumeroDeLlamado().toString()));
			}

		} catch (NegocioException ne) {
			request.setAttribute("error", ne.getMessage());

		} catch (Throwable t) {
			MyLogger.logError(t);
			request.setAttribute("error", "Error Inesperado");
			strForward = "error";
		}
		return mapping.findForward(strForward);
	}

	public boolean validarDenunciaForm(StringBuffer error, ActionForm form) {

		try {
			WebApplicationContext ctx = getWebApplicationContext();
			DenunciaForm denunciaForm = (DenunciaForm) form;
			denunciaForm.getDenunciaDTO().normalizarCollections();

			DenunciaFachada denunciaFachada = (DenunciaFachada) ctx
					.getBean("denunciaFachada");
			boolean ok = true;

			if ((denunciaForm.getDenunciaDTO().getNumeroDeDenuncia() == null || denunciaForm
					.getDenunciaDTO().getNumeroDeDenuncia() == 0)
					&& (denunciaForm.getDenunciaDTO().getNumeroDeLlamado() == null || denunciaForm
							.getDenunciaDTO().getNumeroDeLlamado() == 0)) {
				Validator
						.addErrorXML(error,
								"Debe ingresar Numero de Denuncia y/o Numero de Llamado");
				ok = false;
			}

			if (ok) {
				if (denunciaFachada.existeDenuncia(denunciaForm
						.getDenunciaDTO().getNumeroDeDenuncia(), denunciaForm
						.getDenunciaDTO().getNumeroDeLlamado(), denunciaForm
						.getDenunciaDTO().getId())) {
					Validator.addErrorXML(error,
							"Ya existe una Denuncia con éste número.");
					ok = false;
				}
			}

			boolean ok3 = Validator.requerido(denunciaForm.getDenunciaDTO()
					.getDesde(), "Desde", error);
			boolean ok4 = Validator.requerido(denunciaForm.getDenunciaDTO()
					.getHasta(), "Hasta", error);
			boolean ok5 = Validator.requerido(denunciaForm.getDenunciaDTO()
					.getLugar(), "Lugar", error);

			boolean ok6 = Validator.validarFechaValida(denunciaForm
					.getDenunciaDTO().getDesde(), "Desde", error);
			boolean ok7 = Validator.validarFechaValida(denunciaForm
					.getDenunciaDTO().getHasta(), "Hasta", error);

			boolean ok8 = Validator.validarComboRequerido("-1", String
					.valueOf(denunciaForm.getDenunciaDTO().getProductorId()),
					"Productor", error);

			return ok && ok3 && ok4 && ok5 && ok6 && ok7 && ok8;
		} catch (Throwable t) {
			MyLogger.logError(t);
			Validator.addErrorXML(error, "Error Inesperado");
			return false;
		}
	}

}
