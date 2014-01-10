package ar.com.siig.providers;

import java.util.ArrayList;

import ar.com.siig.dto.AutorizadoDTO;
import ar.com.siig.dto.BoletaDepositoDTO;
import ar.com.siig.dto.EntidadDTO;
import ar.com.siig.dto.EstablecimientoDTO;
import ar.com.siig.dto.GuiaDTO;
import ar.com.siig.dto.LocalidadDTO;
import ar.com.siig.dto.MarcaSenialDTO;
import ar.com.siig.dto.PeriodoDTO;
import ar.com.siig.dto.ProvinciaDTO;
import ar.com.siig.dto.RolDTO;
import ar.com.siig.dto.TipoAnimalDTO;
import ar.com.siig.dto.UsuarioDTO;
import ar.com.siig.dto.VencimientoPeriodoDTO;
import ar.com.siig.enums.TipoDeEntidad;
import ar.com.siig.negocio.Autorizado;
import ar.com.siig.negocio.BoletaDeposito;
import ar.com.siig.negocio.Categoria;
import ar.com.siig.negocio.Entidad;
import ar.com.siig.negocio.Establecimiento;
import ar.com.siig.negocio.Guia;
import ar.com.siig.negocio.ItemMenu;
import ar.com.siig.negocio.Localidad;
import ar.com.siig.negocio.Marca;
import ar.com.siig.negocio.Periodo;
import ar.com.siig.negocio.Productor;
import ar.com.siig.negocio.Provincia;
import ar.com.siig.negocio.RecursosNaturales;
import ar.com.siig.negocio.Rol;
import ar.com.siig.negocio.Senial;
import ar.com.siig.negocio.TipoAnimal;
import ar.com.siig.negocio.Usuario;
import ar.com.siig.negocio.VencimientoPeriodo;
import ar.com.siig.utils.Fecha;

public abstract class ProviderDominio {

	public static Localidad getLocalidad(LocalidadDTO localidadDTO) {

		Localidad localidad = new Localidad();
		localidad.setNombre(localidadDTO.getNombre());
		return localidad;
	}

	public static Localidad getLocalidad(Localidad localidad,
			LocalidadDTO localidadDTO) {

		localidad.setNombre(localidadDTO.getNombre());
		return localidad;
	}

	public static Periodo getPeriodo(PeriodoDTO periodoDTO) {

		Periodo periodo = new Periodo();
		periodo.setPeriodo(periodoDTO.getPeriodo());

		for (VencimientoPeriodoDTO vencimientoDTO : periodoDTO
				.getVencimientoPeriodoDTO()) {
			periodo.getVencimientoPeriodo().add(
					ProviderDominio.getVencimientoPeriodo(periodo,
							vencimientoDTO));
		}

		return periodo;
	}

	public static VencimientoPeriodo getVencimientoPeriodo(Periodo periodo,
			VencimientoPeriodoDTO vencimientoPeriodoDTO) {

		VencimientoPeriodo vencimientoPeriodo = new VencimientoPeriodo();

		vencimientoPeriodo.setPeriodo(periodo);
		vencimientoPeriodo.setFecha(Fecha
				.stringDDMMAAAAToUtilDate(vencimientoPeriodoDTO.getFecha()));
		;

		return vencimientoPeriodo;
	}

	public static Periodo getPeriodo(Periodo periodo, PeriodoDTO periodoDTO) {

		periodo.setPeriodo(periodoDTO.getPeriodo());

		for (VencimientoPeriodoDTO vencDTO : periodoDTO
				.getVencimientoPeriodoDTO()) {

			for (VencimientoPeriodo venc : periodo.getVencimientoPeriodo()) {

				if (vencDTO.getId().longValue() == venc.getId().longValue()) {

					venc.setFecha(Fecha.stringDDMMAAAAToUtilDate(vencDTO
							.getFecha()));
				}
			}
		}

		return periodo;
	}

	// Se usa en el alta de Entidad, por lo tanto no seteo las Marcas y Señales
	// pq no tiene.
	public static Entidad getEntidad(EntidadDTO entidadDTO, Localidad localidad) {

		Entidad entidad = null;
		if (TipoDeEntidad.PRD.getName().equalsIgnoreCase(
				entidadDTO.getTipoEntidad())) {
			entidad = new Productor();
		} else {
			entidad = new RecursosNaturales();
		}

		entidad.setDireccion(entidadDTO.getDireccion());
		entidad.setEmail(entidadDTO.getEmail());
		entidad.setNombre(entidadDTO.getNombre());
		entidad.setTelefono(entidadDTO.getTelefono());
		entidad.setLocalidad(localidad);
		entidad.setNroMatricula(entidadDTO.getNroMatricula());
		entidad.setCuit(entidadDTO.getCuit());
		entidad.setCuil(entidadDTO.getCuil());
		entidad.setDni(entidadDTO.getDni());
		entidad.setTipoDocumento(entidadDTO.getTipoDocumento());
		entidad.setCodigoPostal(entidadDTO.getCodigoPostal());

		return entidad;
	}

	// Se usa en la modificacion de Entidad, por lo tanto no seteo las Marcas y
	// Señales pq no se modifican.
	public static Entidad getEntidad(Entidad entidad, EntidadDTO entidadDTO,
			Localidad localidad) {

		entidad.setDireccion(entidadDTO.getDireccion());
		entidad.setEmail(entidadDTO.getEmail());
		entidad.setLocalidad(localidad);
		entidad.setNombre(entidadDTO.getNombre());
		entidad.setTelefono(entidadDTO.getTelefono());
		entidad.setNroMatricula(entidadDTO.getNroMatricula());
		entidad.setCuit(entidadDTO.getCuit());
		entidad.setCuil(entidadDTO.getCuil());
		entidad.setDni(entidadDTO.getDni());
		entidad.setTipoDocumento(entidadDTO.getTipoDocumento());
		entidad.setCodigoPostal(entidadDTO.getCodigoPostal());
		return entidad;
	}

	public static Usuario getUsuario(UsuarioDTO usuarioDTO, Entidad entidad,
			Rol rol) {

		Usuario usuario = new Usuario();
		usuario.setEntidad(entidad);
		usuario.setHabilitado(usuarioDTO.isHabilitado());
		usuario.setNombreUsuario(usuarioDTO.getNombreUsuario());
		usuario.setPassword(usuarioDTO.getPassword());
		usuario.setRol(rol);

		return usuario;
	}

	public static Usuario getUsuario(Usuario usuario, UsuarioDTO usuarioDTO,
			Entidad entidad, Rol rol) {

		usuario.setEntidad(entidad);
		usuario.setHabilitado(usuarioDTO.isHabilitado());
		usuario.setNombreUsuario(usuarioDTO.getNombreUsuario());
		usuario.setPassword(usuarioDTO.getPassword());
		usuario.setRol(rol);

		return usuario;
	}

	public static Rol getRol(RolDTO rolDTO) {

		Rol rol = new Rol();
		rol.setRol(rolDTO.getRol());
		rol.setMenues(new ArrayList<ItemMenu>());

		return rol;
	}

	public static Provincia getProvincia(ProvinciaDTO provinciaDTO) {

		Provincia provincia = new Provincia();
		provincia.setNombre(provinciaDTO.getNombre());
		return provincia;
	}

	public static Provincia getProvincia(Provincia provincia,
			ProvinciaDTO provinciaDTO) {

		provincia.setNombre(provinciaDTO.getNombre());
		return provincia;
	}

	public static Localidad getLocalidad(LocalidadDTO localidadDTO,
			Provincia provincia) {

		Localidad localidad = new Localidad();
		localidad.setNombre(localidadDTO.getNombre());
		localidad.setProvincia(provincia);

		return localidad;
	}

	public static Localidad getLocalidad(LocalidadDTO localidadDTO,
			Localidad localidad, Provincia provincia) {

		localidad.setNombre(localidadDTO.getNombre());
		localidad.setProvincia(provincia);

		return localidad;
	}

	public static Establecimiento getEstablecimiento(
			EstablecimientoDTO establecimientoDTO, Localidad localidad) {
		Establecimiento establecimiento = new Establecimiento();
		establecimiento.setNombre(establecimientoDTO.getNombre());
		establecimiento.setLocalidad(localidad);
		return establecimiento;
	}

	public static Establecimiento getEstablecimiento(
			EstablecimientoDTO establecimientoDTO,
			Establecimiento establecimiento, Localidad localidad) {
		establecimiento.setNombre(establecimientoDTO.getNombre());
		establecimiento.setLocalidad(localidad);
		return establecimiento;
	}

	public static Marca getMarca(MarcaSenialDTO marcaSenialDTO, Entidad entidad) {

		Marca marca = new Marca();

		marca.setFechaVencimiento(Fecha.stringDDMMAAAAToUtilDate(marcaSenialDTO
				.getFechaVencimiento()));
		marca.setId(marcaSenialDTO.getId());
		marca.setImagen(marcaSenialDTO.getImagen());
		marca.setNumero(marcaSenialDTO.getNumero());
		marca.setBoletaDeposito(ProviderDominio
				.getBoletaDeposito(marcaSenialDTO.getBoletaDeposito()));
		marca.setProductor(entidad);
		marca.setNombreImagen(marcaSenialDTO.getNombreImagen());

		return marca;
	}

	public static Senial getSenial(MarcaSenialDTO marcaSenialDTO,
			Entidad entidad) {

		Senial senial = new Senial();

		senial.setFechaVencimiento(Fecha
				.stringDDMMAAAAToUtilDate(marcaSenialDTO.getFechaVencimiento()));
		senial.setId(marcaSenialDTO.getId());
		senial.setImagen(marcaSenialDTO.getImagen());
		senial.setNumero(marcaSenialDTO.getNumero());
		senial.setBoletaDeposito(ProviderDominio
				.getBoletaDeposito(marcaSenialDTO.getBoletaDeposito()));
		senial.setProductor(entidad);
		senial.setNombreImagen(marcaSenialDTO.getNombreImagen());

		return senial;
	}

	public static BoletaDeposito getBoletaDeposito(BoletaDepositoDTO boletaDTO) {

		BoletaDeposito boleta = new BoletaDeposito();
		if (boletaDTO.getFechaPago() != null
				&& !boletaDTO.getFechaPago().equals("")) {
			boleta.setFechaPago(Fecha.stringDDMMAAAAToUtilDate(boletaDTO
					.getFechaPago()));
		}
		boleta.setFechaVencimiento(Fecha.stringDDMMAAAAToUtilDate(boletaDTO
				.getFechaVencimiento()));
		boleta.setId(boletaDTO.getId());
		boleta.setMonto(boletaDTO.getMonto());
		boleta.setNumero(boletaDTO.getNumero());

		return boleta;
	}

	public static Guia getGuia(GuiaDTO guiaDTO, Marca marca,
			Productor productor, Senial senial) {

		Guia guia = new Guia();
		guia.setFechaLegalizacion(Fecha.stringDDMMAAAAToUtilDate(guiaDTO
				.getFechaLegalizacion()));
		guia.setMarca(marca);
		guia.setNumero(guiaDTO.getNumero());
		guia.setNumeroInterno(guiaDTO.getNumeroInterno());
		guia.setPeriodo(guiaDTO.getPeriodo());
		guia.setProductor(productor);
		guia.setSenial(senial);

		return guia;
	}

	public static Autorizado getAutorizado(AutorizadoDTO autorizadoDTO) {
		Autorizado autorizado = new Autorizado();
		autorizado.setNombre(autorizadoDTO.getNombre());
		autorizado.setDni(autorizadoDTO.getDni());
		return autorizado;
	}

	public static TipoAnimal getTipoAnimal(TipoAnimalDTO tipoAnimalDTO,
			Categoria categoria) {
		TipoAnimal tipoAnimal = new TipoAnimal();
		tipoAnimal.setDescripcion(tipoAnimalDTO.getDescripcion());
		tipoAnimal.setCategoria(categoria);
		tipoAnimal.setValor(Double.valueOf(tipoAnimalDTO.getValor()));
		return tipoAnimal;
	}
}
