
package database;
public class Reporteria {
    private int ticket;
    private String identidad;
    private String nombre;
    private String discapacidad;
    private int id_local;
    private int id_area;
    private String fecha1;
    private String fecha2;
    private String fecha3;

    public Reporteria() {
    }

    public Reporteria(int ticket, String identidad, String nombre, String discapacidad, int id_local, int id_area, String fecha1, String fecha2, String fecha3) {
        this.ticket = ticket;
        this.identidad = identidad;
        this.nombre = nombre;
        this.discapacidad = discapacidad;
        this.id_local = id_local;
        this.id_area = id_area;
        this.fecha1 = fecha1;
        this.fecha2 = fecha2;
        this.fecha3 = fecha3;
    }

    public int getTicket() {
        return ticket;
    }

    public void setTicket(int ticket) {
        this.ticket = ticket;
    }

    public String getIdentidad() {
        return identidad;
    }

    public void setIdentidad(String identidad) {
        this.identidad = identidad;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDiscapacidad() {
        return discapacidad;
    }

    public void setDiscapacidad(String discapacidad) {
        this.discapacidad = discapacidad;
    }

    public int getId_local() {
        return id_local;
    }

    public void setId_local(int id_local) {
        this.id_local = id_local;
    }

    public int getId_area() {
        return id_area;
    }

    public void setId_area(int id_area) {
        this.id_area = id_area;
    }

    public String getFecha1() {
        return fecha1;
    }

    public void setFecha1(String fecha1) {
        this.fecha1 = fecha1;
    }

    public String getFecha2() {
        return fecha2;
    }

    public void setFecha2(String fecha2) {
        this.fecha2 = fecha2;
    }

    public String getFecha3() {
        return fecha3;
    }

    public void setFecha3(String fecha3) {
        this.fecha3 = fecha3;
    }
       
}
