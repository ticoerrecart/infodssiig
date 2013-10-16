package ar.com.siig.utils;

import org.apache.commons.beanutils.converters.AbstractConverter;

import ar.com.siig.dto.LocalidadDTO;
import ar.com.siig.negocio.Localidad;

public class LocalidadConverter extends AbstractConverter {

	@Override
	protected Object convertToType(Class type, Object value) throws Throwable {
		// TODO Auto-generated method stub
		LocalidadDTO localidadDTO = (LocalidadDTO)value;
		Localidad l = new Localidad();
		l.setId(localidadDTO.getId());
		return l;
	}

	@Override
	protected Class getDefaultType() {
		return Localidad.class;
	}

}
