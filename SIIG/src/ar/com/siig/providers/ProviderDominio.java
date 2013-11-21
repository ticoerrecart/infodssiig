package ar.com.siig.providers;

import java.util.ArrayList;

import ar.com.siig.dto.EntidadDTO;
import ar.com.siig.dto.LocalidadDTO;
import ar.com.siig.dto.PeriodoDTO;
import ar.com.siig.dto.ProvinciaDTO;
import ar.com.siig.dto.RolDTO;
import ar.com.siig.dto.UsuarioDTO;
import ar.com.siig.dto.VencimientoPeriodoDTO;
import ar.com.siig.enums.TipoDeEntidad;
import ar.com.siig.negocio.Entidad;
import ar.com.siig.negocio.ItemMenu;
import ar.com.siig.negocio.Localidad;
import ar.com.siig.negocio.Periodo;
import ar.com.siig.negocio.Productor;
import ar.com.siig.negocio.Provincia;
import ar.com.siig.negocio.RecursosNaturales;
import ar.com.siig.negocio.Rol;
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

}
