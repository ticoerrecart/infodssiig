package ar.com.siig.providers;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.beanutils.BeanUtils;

import ar.com.siig.dto.EntidadDTO;
import ar.com.siig.dto.LocalidadDTO;
import ar.com.siig.dto.PeriodoDTO;
import ar.com.siig.dto.RolDTO;
import ar.com.siig.dto.UsuarioDTO;
import ar.com.siig.enums.TipoDeEntidad;
import ar.com.siig.negocio.Entidad;
import ar.com.siig.negocio.ItemMenu;
import ar.com.siig.negocio.Localidad;
import ar.com.siig.negocio.Periodo;
import ar.com.siig.negocio.Productor;
import ar.com.siig.negocio.RecursosNaturales;
import ar.com.siig.negocio.Rol;
import ar.com.siig.negocio.TipoProducto;
import ar.com.siig.negocio.Usuario;
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

		return periodo;
	}

	public static Periodo getPeriodo(Periodo periodo, PeriodoDTO periodoDTO) {
	
		periodo.setPeriodo(periodoDTO.getPeriodo());
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

}
