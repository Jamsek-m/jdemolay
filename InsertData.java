import java.io.*;
import java.util.ArrayList;
public class InsertData{

	public static void main(String[] args){
		
		try{
			BufferedReader br = new BufferedReader(new FileReader("items.csv"));
		ArrayList<Zapis> lista = new ArrayList<Zapis>();

			String line = br.readLine();
			while(line != null){
				lista.add(new Zapis(line));
				line = br.readLine();
			}

			for(Zapis item : lista){
				System.out.println(item.vrniSQLInsert());
			}


		}catch(IOException e){
			e.printStackTrace();
		}
	}
}

class Zapis{

	public String naziv;
	public String mon_val;
	public Zapis(String s){
		String[] params = s.split(";");
		this.naziv = params[0];
		this.mon_val = params[1];
	}

	public String vrniSQLInsert(){
		return "INSERT INTO sif_res(NAZIV, MON_VAL) VALUES ('"+this.naziv+"', '"+this.mon_val+"');";
	}



}