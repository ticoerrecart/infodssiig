package ar.com.siig.providers;

import java.util.ArrayList;
import java.util.List;

import ar.com.siig.dto.AutorizadoDTO;
import ar.com.siig.dto.BoletaDepositoDTO;
import ar.com.siig.dto.EntidadDTO;
import ar.com.siig.dto.EstablecimientoDTO;
import ar.com.siig.dto.ItemMenuDTO;
import ar.com.siig.dto.LocalidadDTO;
import ar.com.siig.dto.MarcaSenialDTO;
import ar.com.siig.dto.PeriodoDTO;
import ar.com.siig.dto.ProvinciaDTO;
import ar.com.siig.dto.RolDTO;
import ar.com.siig.dto.TipoAutorizacionDTO;
import ar.com.siig.dto.TipoProductoDTO;
import ar.com.siig.dto.UsuarioDTO;
import ar.com.siig.dto.VencimientoPeriodoDTO;
import ar.com.siig.negocio.Autorizado;
import ar.com.siig.negocio.BoletaDeposito;
import ar.com.siig.negocio.Entidad;
import ar.com.siig.negocio.Establecimiento;
import ar.com.siig.negocio.ItemMenu;
import ar.com.siig.negocio.Localidad;
import ar.com.siig.negocio.Marca;
import ar.com.siig.negocio.MarcaSenial;
import ar.com.siig.negocio.Periodo;
import ar.com.siig.negocio.Provincia;
import ar.com.siig.negocio.Rol;
import ar.com.siig.negocio.Senial;
import ar.com.siig.negocio.TipoAutorizacion;
import ar.com.siig.negocio.TipoProducto;
import ar.com.siig.negocio.Usuario;
import ar.com.siig.negocio.VencimientoPeriodo;
import ar.com.siig.utils.Fecha;

public abstract class ProviderDTO {

	public static UsuarioDTO getUsuarioDTO(Usuario usuario) {

		UsuarioDTO usuarioDTO = new UsuarioDTO();

		usuarioDTO.setId(usuario.getId());
		usuarioDTO.setNombreUsuario(usuario.getNombreUsuario());
		usuarioDTO.setPassword(usuario.getPassword());
		usuarioDTO.setRol(ProviderDTO.getRolDTO(usuario.getRol()));
		usuarioDTO.setEntidad(ProviderDTO.getEntidadDTO(usuario.getEntidad()));
		usuarioDTO.setHabilitado(usuario.isHabilitado());

		return usuarioDTO;
	}

	public static RolDTO getRolDTO(Rol rol) {

		List<ItemMenuDTO> listaMenuesDTO = new ArrayList<ItemMenuDTO>();
		RolDTO rolDTO = new RolDTO();

		rolDTO.setId(rol.getId());
		rolDTO.setRol(rol.getRol());

		for (ItemMenu menu : rol.getMenues()) {
			listaMenuesDTO.add(ProviderDTO.getItemMenuDTO(menu));
		}
		rolDTO.setMenues(listaMenuesDTO);

		return rolDTO;
	}

	public static ItemMenuDTO getItemMenuDTO(ItemMenu menu) {
		return ProviderDTO.getItemMenuDTO(menu, null);
	}

	private static ItemMenuDTO getItemMenuDTO(ItemMenu menu, ItemMenuDTO padre) {

		if (menu != null) {
			List<ItemMenuDTO> listaMenuDTO = new ArrayList<ItemMenuDTO>();
			ItemMenuDTO menuDTO = new ItemMenuDTO();

			menuDTO.setId(menu.getId());
			menuDTO.setItem(menu.getItem());
			menuDTO.setOrden(menu.getOrden());
			menuDTO.setPadre(padre);
			menuDTO.setUrl(menu.getUrl());

			for (ItemMenu menuHijo : menu.getHijos()) {
				listaMenuDTO.add(ProviderDTO.getItemMenuDTO(menuHijo, menuDTO));
			}
			menuDTO.setHijos(listaMenuDTO);

			return menuDTO;
		} else {
			return null;
		}
	}

	public static PeriodoDTO getPeriodoDTO(Periodo periodo) {

		PeriodoDTO periodoDTO = new PeriodoDTO();

		periodoDTO.setId(periodo.getId());
		periodoDTO.setPeriodo(periodo.getPeriodo());

		for (VencimientoPeriodo vencimientoPeriodo : periodo
				.getVencimientoPeriodo()) {

			periodoDTO.getVencimientoPeriodoDTO().add(
					ProviderDTO.getVencimientoPeriodoDTO(periodoDTO,
							vencimientoPeriodo));
		}

		return periodoDTO;
	}

	public static VencimientoPeriodoDTO getVencimientoPeriodoDTO(
			PeriodoDTO periodoDTO, VencimientoPeriodo vencimientoPeriodo) {

		VencimientoPeriodoDTO vencimientoPeriodoDTO = new VencimientoPeriodoDTO();

		vencimientoPeriodoDTO.setId(vencimientoPeriodo.getId());
		vencimientoPeriodoDTO.setPeriodoDTO(periodoDTO);
		vencimientoPeriodoDTO.setFecha(Fecha.getFechaDDMMAAAASlash(Fecha
				.dateToStringDDMMAAAA(vencimientoPeriodo.getFecha())));

		return vencimientoPeriodoDTO;
	}

	public static EntidadDTO getEntidadDTO(Entidad entidad) {

		EntidadDTO entidadDTO = new EntidadDTO();

		entidadDTO.setId(entidad.getId());
		entidadDTO.setNombre(entidad.getNombre());
		entidadDTO.setDireccion(entidad.getDireccion());
		entidadDTO.setTelefono(entidad.getTelefono());
		entidadDTO.setEmail(entidad.getEmail());
		entidadDTO.setLocalidad(ProviderDTO.getLocalidadDTO(entidad
				.getLocalidad()));
		entidadDTO.setTipoEntidadDesc(entidad.getTipoEntidad());
		entidadDTO.setTipoEntidad(entidad.getIdTipoEntidad());
		entidadDTO.setNroMatricula(entidad.getNroMatricula());
		entidadDTO.setCuit(entidad.getCuit());
		entidadDTO.setCuil(entidad.getCuil());
		entidadDTO.setDni(entidad.getDni());
		entidadDTO.setTipoDocumento(entidad.getTipoDocumento());
		entidadDTO.setCodigoPostal(entidad.getCodigoPostal());

		List<MarcaSenialDTO> listaMarcasDTO = new ArrayList<MarcaSenialDTO>();
		for (Marca marca : entidad.getMarcas()) {
			listaMarcasDTO.add(getMarcaSenialDTO(marca));
		}
		entidadDTO.setMarcas(listaMarcasDTO);

		List<MarcaSenialDTO> listaSenialesDTO = new ArrayList<MarcaSenialDTO>();
		for (Senial senial : entidad.getSeniales()) {
			listaSenialesDTO.add(getMarcaSenialDTO(senial));
		}
		entidadDTO.setSeniales(listaSenialesDTO);		

		return entidadDTO;
	}

	public static TipoProductoDTO getTipoProductoDTO(TipoProducto tipoProducto) {
		TipoProductoDTO tipoProdDTO = new TipoProductoDTO();
		tipoProdDTO.setId(tipoProducto.getId());
		tipoProdDTO.setNombre(tipoProducto.getNombre());
		return tipoProdDTO;
	}

	public static ProvinciaDTO getProvinciaDTO(Provincia provincia) {
		ProvinciaDTO provinciaDTO = new ProvinciaDTO();
		provinciaDTO.setId(provincia.getId());
		provinciaDTO.setNombre(provincia.getNombre());
		return provinciaDTO;
	}

	public static LocalidadDTO getLocalidadDTO(Localidad localidad) {
		LocalidadDTO localidadDTO = new LocalidadDTO();
		localidadDTO.setId(localidad.getId());
		localidadDTO.setNombre(localidad.getNombre());
		localidadDTO.setProvinciaDTO(ProviderDTO.getProvinciaDTO(localidad
				.getProvincia()));
		return localidadDTO;
	}

	public static EstablecimientoDTO getEstablecimientoDTO(
			Establecimiento establecimiento) {
		EstablecimientoDTO establecimientoDTO = new EstablecimientoDTO();
		establecimientoDTO.setId(establecimiento.getId());
		establecimientoDTO.setNombre(establecimiento.getNombre());
		establecimientoDTO.setLocalidadDTO(ProviderDTO.getLocalidadDTO(establecimiento.getLocalidad()));
		return establecimientoDTO;
	}

	public static MarcaSenialDTO getMarcaSenialDTO(MarcaSenial marcaSenial){
		
		MarcaSenialDTO marcaSenialDTO = new MarcaSenialDTO();
		marcaSenialDTO.setTipo(marcaSenial.getIdTipoMarcaSenial());
		marcaSenialDTO.setBoletaDeposito(getBoletaDepositoDTO(marcaSenial.getBoletaDeposito()));
		marcaSenialDTO.setFechaVencimiento(Fecha.getFechaDDMMAAAASlash(
					  					   Fecha.dateToStringDDMMAAAA(marcaSenial.getFechaVencimiento())));
		marcaSenialDTO.setId(marcaSenial.getId());
		marcaSenialDTO.setImagen(marcaSenial.getImagen());
		marcaSenialDTO.setNumero(marcaSenial.getNumero());
		
		return marcaSenialDTO;
	}
	
	public static BoletaDepositoDTO getBoletaDepositoDTO(BoletaDeposito boleta){
		
		BoletaDepositoDTO boletaDTO = new BoletaDepositoDTO();
		if(boleta.getFechaPago() != null && !boleta.getFechaPago().equals("")){
			boletaDTO.setFechaPago(Fecha.getFechaDDMMAAAASlash(
					Fecha.dateToStringDDMMAAAA(boleta.getFechaPago())));
		}	
		boletaDTO.setFechaVencimiento(Fecha.getFechaDDMMAAAASlash(
				   					  Fecha.dateToStringDDMMAAAA(boleta.getFechaVencimiento())));
		boletaDTO.setId(boleta.getId());
		boletaDTO.setMonto(boleta.getMonto());
		boletaDTO.setNumero(boleta.getNumero());
		
		return boletaDTO;
	}
	
	public static AutorizadoDTO getAutorizadoDTO(Autorizado autorizado) {
		AutorizadoDTO autorizadoDTO = new AutorizadoDTO();
		autorizadoDTO.setId(autorizado.getId());
		autorizadoDTO.setDni(autorizado.getDni());
		autorizadoDTO.setNombre(autorizado.getNombre());
		return autorizadoDTO;
	}

	public static TipoAutorizacionDTO getTipoAutorizacionDTO(
			TipoAutorizacion tipoAutorizacion) {
		TipoAutorizacionDTO tipoAutorizacionDTO = new TipoAutorizacionDTO();
		tipoAutorizacionDTO.setId(tipoAutorizacion.getId());
		tipoAutorizacionDTO.setDescripcion(tipoAutorizacion.getDescripcion());
		return tipoAutorizacionDTO;
	}

}
