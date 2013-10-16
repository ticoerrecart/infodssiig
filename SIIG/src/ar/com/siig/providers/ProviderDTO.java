package ar.com.siig.providers;

import java.util.ArrayList;
import java.util.List;

import ar.com.siig.dto.EntidadDTO;
import ar.com.siig.dto.ItemMenuDTO;
import ar.com.siig.dto.LocalidadDTO;
import ar.com.siig.dto.PeriodoDTO;
import ar.com.siig.dto.RolDTO;
import ar.com.siig.dto.TipoProductoDTO;
import ar.com.siig.dto.UsuarioDTO;
import ar.com.siig.negocio.Entidad;
import ar.com.siig.negocio.ItemMenu;
import ar.com.siig.negocio.Localidad;
import ar.com.siig.negocio.Periodo;
import ar.com.siig.negocio.Rol;
import ar.com.siig.negocio.TipoProducto;
import ar.com.siig.negocio.Usuario;

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

	public static LocalidadDTO getLocalidadDTO(Localidad localidad) {

		LocalidadDTO localidadDTO = new LocalidadDTO();

		localidadDTO.setId(localidad.getId());
		localidadDTO.setNombre(localidad.getNombre());

		return localidadDTO;
	}

	public static PeriodoDTO getPeriodoDTO(Periodo periodo) {

		PeriodoDTO periodoDTO = new PeriodoDTO();

		periodoDTO.setId(periodo.getId());
		periodoDTO.setPeriodo(periodo.getPeriodo());

		return periodoDTO;
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

		return entidadDTO;
	}

	public static TipoProductoDTO getTipoProductoDTO(TipoProducto tipoProducto) {

		TipoProductoDTO tipoProdDTO = new TipoProductoDTO();
		tipoProdDTO.setId(tipoProducto.getId());
		tipoProdDTO.setNombre(tipoProducto.getNombre());

		return tipoProdDTO;
	}

}
