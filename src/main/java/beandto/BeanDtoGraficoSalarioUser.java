package beandto;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

public class BeanDtoGraficoSalarioUser implements Serializable {

	private static final long serialVersionUID = 1L;

	List<String> ufs = new ArrayList<String>();
	List<Double> salarios = new ArrayList<Double>();

	public List<String> getUfs() {
		return ufs;
	}

	public void setUfs(List<String> ufs) {
		this.ufs = ufs;
	}

	public List<Double> getSalarios() {
		return salarios;
	}

	public void setSalarios(List<Double> salarios) {
		this.salarios = salarios;
	}

}
