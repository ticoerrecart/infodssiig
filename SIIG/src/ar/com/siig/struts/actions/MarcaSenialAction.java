package ar.com.siig.struts.actions;

import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.rowset.serial.SerialBlob;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.springframework.web.context.WebApplicationContext;

import ar.com.siig.dto.EntidadDTO;
import ar.com.siig.enums.TipoCanonMarcaSenial;
import ar.com.siig.enums.TipoMarcaSenial;
import ar.com.siig.fachada.EntidadFachada;
import ar.com.siig.fachada.MarcaSenialFachada;
import ar.com.siig.negocio.CanonMarcaSenial;
import ar.com.siig.negocio.Productor;
import ar.com.siig.struts.actions.forms.CanonMarcaSenialForm;
import ar.com.siig.struts.actions.forms.MarcaSenialForm;
import ar.com.siig.struts.utils.Validator;
import ar.com.siig.utils.Constantes;
import ar.com.siig.utils.MyLogger;

public class MarcaSenialAction extends ValidadorAction {

	@SuppressWarnings("unchecked")
	public ActionForward cargarCanonMarcaSenial(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		String strForward = "exitoRecuperarMarcasSeniales";

		try {
			WebApplicationContext ctx = getWebApplicationContext();
			MarcaSenialFachada marcaSenialFachada = (MarcaSenialFachada) ctx
					.getBean("marcaSenialFachada");

			List<CanonMarcaSenial> lista = marcaSenialFachada
					.recuperarCanonMarcaSenial();

			request.setAttribute("listaCanonMarcaSenial", lista);

		} catch (Throwable t) {
			MyLogger.logError(t);
			request.setAttribute("error", "Error Inesperado");
			strForward = "error";
		}
		return mapping.findForward(strForward);
	}

	@SuppressWarnings("unchecked")
	public ActionForward cargarMarcaSenialAModificar(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		String strForward = "exitoCargarMarcaSenialAModificar";

		try {
			WebApplicationContext ctx = getWebApplicationContext();
			MarcaSenialFachada marcaSenialFachada = (MarcaSenialFachada) ctx
					.getBean("marcaSenialFachada");

			String id = request.getParameter("id");
			CanonMarcaSenial canonMarcaSenial = marcaSenialFachada
					.recuperarCanonMarcaSenial(Long.valueOf(id));

			request.setAttribute("canonMarcaSenial", canonMarcaSenial);

		} catch (Throwable t) {
			MyLogger.logError(t);
			request.setAttribute("error", "Error Inesperado");
			strForward = "error";
		}
		return mapping.findForward(strForward);
	}

	@SuppressWarnings("unchecked")
	public ActionForward modificarCanonMarcaSenial(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		String strForward = "exitoModificacionCanonMarcaSenial";

		try {
			WebApplicationContext ctx = getWebApplicationContext();
			MarcaSenialFachada marcaSenialFachada = (MarcaSenialFachada) ctx
					.getBean("marcaSenialFachada");
			CanonMarcaSenialForm canonMarcaSenialForm = (CanonMarcaSenialForm) form;

			// valido nuevamente por seguridad.
			if (!validarCanonMarcaSenialForm(new StringBuffer(),
					canonMarcaSenialForm)) {
				throw new Exception("Error de Seguridad");
			}

			marcaSenialFachada.modificarCanonMarcaSenial(canonMarcaSenialForm
					.getCanonMarcaSenial());

			request.setAttribute("exitoGrabado",
					Constantes.EXITO_MODIFICACION_CANON_MARCA_SENIAL);

		} catch (Throwable t) {
			MyLogger.logError(t);
			request.setAttribute("error", "Error Inesperado");
			strForward = "error";
		}
		return mapping.findForward(strForward);
	}

	@SuppressWarnings("unchecked")
	public ActionForward cargarAltaRenovacionMarcaSenial(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		String strForward = "exitoCargarAltaRenovacionMarcaSenial";

		try {
			WebApplicationContext ctx = getWebApplicationContext();
			EntidadFachada entidadFachada = (EntidadFachada) ctx
					.getBean("entidadFachada");
			MarcaSenialFachada marcaSenialFachada = (MarcaSenialFachada) ctx
					.getBean("marcaSenialFachada");
			// String path =
			// request.getServletContext().getRealPath("imagenes");

			List<EntidadDTO> listaProductores = entidadFachada
					.getProductoresDTO();

			request.setAttribute("productores", listaProductores);

			request.setAttribute("tipoMarcaSenial",
					marcaSenialFachada.recuperarTipoCanonMarcaSenial());
			request.setAttribute("canonMarcaSenial", marcaSenialFachada
					.recuperarCanonMarcaSenial(TipoCanonMarcaSenial.AltaMarca
							.getName()));
			/*
			 * MarcaSenialDTO marcaSenialDTO =
			 * marcaSenialFachada.getMarcaDTOPath( ((EntidadDTO)
			 * listaProductores.get(0)).getId(), path);
			 * request.setAttribute("imagen", marcaSenialDTO.getNombreImagen());
			 */

		} catch (Throwable t) {
			MyLogger.logError(t);
			request.setAttribute("error", "Error Inesperado");
			strForward = "error";
		}
		return mapping.findForward(strForward);
	}

	@SuppressWarnings("unchecked")
	public ActionForward altaRenovacionMarcaSenial(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		String strForward = "exitoAltaRenovacionMarcaSenial";

		try {
			MarcaSenialForm marcaSenialForm = (MarcaSenialForm) form;
			WebApplicationContext ctx = getWebApplicationContext();
			MarcaSenialFachada marcaSenialFachada = (MarcaSenialFachada) ctx
					.getBean("marcaSenialFachada");

			SerialBlob blob = new SerialBlob(marcaSenialForm.getImagen()
					.getFileData());

			Long tamanio = blob.length() / 1024 / 1024;
			if (tamanio > 1) {
				request.setAttribute(
						"error",
						"El tamaño de la imagen es mayor a 1MB.  Intente nuevamente con una imagen de menor tamaño.");
			} else {
				marcaSenialFachada.altaRenovacionMarcaSenial(
						marcaSenialForm.getMarcaSenial(),
						marcaSenialForm.isUtilizarImagenAnterior(), blob);

				if (TipoCanonMarcaSenial.AltaMarca.getName().equals(
						marcaSenialForm.getMarcaSenial().getTipo())) {
					request.setAttribute("exitoGrabado",
							Constantes.EXITO_ALTA_MARCA);
				}
				if (TipoCanonMarcaSenial.RenovacionMarca.getName().equals(
						marcaSenialForm.getMarcaSenial().getTipo())) {
					request.setAttribute("exitoGrabado",
							Constantes.EXITO_RENOVACION_MARCA);
				}

				if (TipoCanonMarcaSenial.AltaSenial.getName().equals(
						marcaSenialForm.getMarcaSenial().getTipo())) {
					request.setAttribute("exitoGrabado",
							Constantes.EXITO_ALTA_SENIAL);
				}

				if (TipoCanonMarcaSenial.RenovacionSenial.getName().equals(
						marcaSenialForm.getMarcaSenial().getTipo())) {
					request.setAttribute("exitoGrabado",
							Constantes.EXITO_RENOVACION_SENIAL);
				}
			}
		} catch (Throwable t) {
			MyLogger.logError(t);
			request.setAttribute("error", "Error Inesperado");
			strForward = "error";
		}
		return mapping.findForward(strForward);
	}

	@SuppressWarnings("unchecked")
	public ActionForward cargarPagoBoletasMarcaSenial(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		String strForward = "exitoCargarPagoBoletasMarcaSenial";

		try {
			WebApplicationContext ctx = getWebApplicationContext();
			EntidadFachada entidadFachada = (EntidadFachada) ctx
					.getBean("entidadFachada");
			MarcaSenialFachada marcaSenialFachada = (MarcaSenialFachada) ctx
					.getBean("marcaSenialFachada");

			List<EntidadDTO> listaProductores = entidadFachada
					.getProductoresDTO();

			request.setAttribute("productores", listaProductores);
			request.setAttribute("tipoMarcaSenial",
					marcaSenialFachada.recuperarTipoMarcaSenial());

		} catch (Throwable t) {
			MyLogger.logError(t);
			request.setAttribute("error", "Error Inesperado");
			strForward = "error";
		}
		return mapping.findForward(strForward);
	}

	@SuppressWarnings("unchecked")
	public ActionForward cargarMarcasSenialesParaPagoBoletas(
			ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		String strForward = "exitoCargarMarcasSenialesParaPagoBoletas";

		try {
			WebApplicationContext ctx = getWebApplicationContext();
			EntidadFachada entidadFachada = (EntidadFachada) ctx
					.getBean("entidadFachada");

			String idProd = request.getParameter("idProductor");
			String idTipo = request.getParameter("idTipo");
			// EntidadDTO productor =
			// entidadFachada.getEntidadDTO(Long.valueOf(idProd));
			Productor productor = entidadFachada.getProductor(Long
					.valueOf(idProd));

			if (idTipo.equalsIgnoreCase(TipoMarcaSenial.Marca.getName())) {
				Collections.sort(productor.getMarcas());
				request.setAttribute("listaMarcaSenial", productor.getMarcas());
			} else {
				Collections.sort(productor.getSeniales());
				request.setAttribute("listaMarcaSenial",
						productor.getSeniales());
			}

		} catch (Throwable t) {
			MyLogger.logError(t);
			request.setAttribute("error", "Error Inesperado");
			strForward = "error";
		}
		return mapping.findForward(strForward);
	}

	public boolean validarCanonMarcaSenialForm(StringBuffer error,
			ActionForm form) {
		try {
			CanonMarcaSenialForm canonMarcaSenialForm = (CanonMarcaSenialForm) form;
			String valor = String.valueOf(canonMarcaSenialForm
					.getCanonMarcaSenial().getMonto());
			boolean ok = Validator.validarDoubleMayorQue(0, valor, "Monto",
					error);

			return ok;

		} catch (Throwable t) {
			MyLogger.logError(t);
			Validator.addErrorXML(error, "Error Inesperado");
			return false;
		}
	}

	public boolean validarMarcaSenialForm(StringBuffer error, ActionForm form) {

		boolean ok1;
		boolean ok2;
		boolean ok3 = true;
		boolean ok4;
		boolean ok5;
		boolean ok6;
		MarcaSenialForm marcaSenialForm = (MarcaSenialForm) form;

		ok1 = Validator.requerido(marcaSenialForm.getMarcaSenial().getNumero(),
				"Número", error);
		ok2 = Validator.requerido(marcaSenialForm.getMarcaSenial()
				.getFechaVencimiento(), "Fecha de Vencimiento", error);
		if (!marcaSenialForm.isUtilizarImagenAnterior()) {
			ok3 = Validator.requerido(marcaSenialForm.getMarcaSenial()
					.getNombreImagen(), "Imagen", error);
		}
		ok4 = Validator.validarEnteroMayorQue(
				0,
				String.valueOf(marcaSenialForm.getMarcaSenial()
						.getBoletaDeposito().getNumero()),
				"Número de Boleta de Deposito", error);
		ok5 = Validator.validarDoubleMayorQue(
				0,
				String.valueOf(marcaSenialForm.getMarcaSenial()
						.getBoletaDeposito().getMonto()),
				"Monto de Boleta de Deposito", error);
		ok6 = Validator.requerido(marcaSenialForm.getMarcaSenial()
				.getBoletaDeposito().getFechaVencimiento(),
				"Fecha de Vencimiento de Boleta de Deposito", error);

		return ok1 && ok2 && ok3 && ok4 && ok5 && ok6;
	}
}
