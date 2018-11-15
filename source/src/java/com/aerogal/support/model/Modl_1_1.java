package com.aerogal.support.model;

import com.aerogal.support.controller.dto.GuiaDeCargaDTO;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
/////////////////
import java.text.DecimalFormatSymbols;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.StringTokenizer;
import org.apache.log4j.Logger;
import org.apache.log4j.helpers.DateTimeDateFormat;
/////////////////

public class Modl_1_1
        implements Serializable {

    /*
     Corresponde el tipo de carga que se va realizar G Guia F Factura
     */
    private static Logger logger = Logger.getLogger(Modl_1_1.class);
    private static final String TIPO_G = "G";
    private static final String TIPO_F = "F";

    private static final String SERARADOR_RANGO = "-";

    protected int Codproveedor = 0;
    protected int Codcliente = 0;
    protected List listadescuento;
    protected List Listap;
    protected List Listatc;
    protected List Listapta;
    protected List Listapagos;
    protected List Listaclic;
    protected List Listamanifiesto;
    protected int validez = 0;
    protected int restricciones = 0;
    protected float comision = 0.0F;
    protected long Codtarjeta = 0L;
    protected String jdbcDriver;
    protected String databaseURL;
    protected transient Connection con;
    protected String usuario;
    protected String clave;
    protected String Error = "";
    protected String Exito = "";
    protected Usuarios usr;
    protected List aviones;
    protected String norigen;
    protected String ndestino;
    protected Timestamp desde;
    protected Timestamp hasta;
    protected String accion;
    protected List Lista;
    protected List Lista1;
    protected List Lista2;
    protected List ListaDetTarj;
    protected List Lista2i;
    protected List Lista3;
    protected List Listai;
    protected List ListaGuiasM;
    protected List Listaauditoria;
    protected int maxfila;
    protected int maxcolumna;
    protected String ipdir;
    protected float cambio;
    protected int nivel = 1;
    protected long reserva = 0L;
    protected List lista;
    protected float resultadoCierre = 0.0F;
    protected DetalleCobroTarjeta detalleCobro;
    protected int isLoadedTabledT =0;
    protected String DestinoCbx;
    protected String ClienteCbx;
    protected int IsNewGF;

	//ADDED ON OCT 2018
	protected String url;

    private GuiaDeCargaDTO dtoToPrint;

    public void Limpiarlistas() {
        this.listadescuento = null;
        this.Listap = null;
        this.Listatc = null;
        this.Listapta = null;
        this.Listapagos = null;
        this.aviones = null;
        this.Lista = null;
        this.Lista1 = null;
        this.Lista2 = null;
        this.Lista2i = null;
        this.ListaDetTarj = null;
        this.Lista3 = null;
        this.Listai = null;
        this.Listamanifiesto = null;
        this.ListaGuiasM = null;
        this.DestinoCbx=null;
        this.ClienteCbx=null;
        this.lista = null;
        System.gc();
    }

    public String getIpdir() {
        return this.ipdir;
    }

    public void setIpdir(String ipdir) {
        this.ipdir = ipdir;
    }

    public void connect()
            throws SQLException {
        if (isConnected()) {
            throw new SQLException("Ya esta Conectado");
        }
        if (this.jdbcDriver == null) {
            throw new SQLException("No Existe JDB Driver");
        }
        if (this.databaseURL == null) {
            throw new SQLException("No Existe Data Base URL");
        }
        if (this.usuario == null) {
            throw new SQLException("No existe Usuario");
        }
        if (this.clave == null) {
            throw new SQLException("No existe Clave");
        }
         //ADDED ON OCT 2018
         String dbName = System.getenv("dbName");
        //String dbName = "Avainicas_PS";
        //String dbName = "cargasqldb";
         url = String.format("jdbc:sqlserver://%s;database=%s;user=%s;password=%s;trustServerCertificate=true;useSSL=false;", this.databaseURL, dbName, this.usuario, this.clave);
        //MODIFIED FOR CONTAINERIZATION
        //url = String.format("%s;database=%s;user=%s;password=%s;trustServerCertificate=true;useSSL=false;",this.databaseURL, dbName, this.usuario, this.clave);
        //MODIFIED FOR POSTGRES       
       //this.databaseURL = this.databaseURL.replace("\"", "");
       url = String.format("%s",this.databaseURL); 
       this.databaseURL = url;
       //ADDED ON OCT 2018 - END
        try {
            Class.forName(this.jdbcDriver).newInstance();
        } catch (Exception e) {
            throw new SQLException("No se pudo cargar el driver " + this.jdbcDriver);
        }
		
      // this.con = DriverManager.getConnection(this.databaseURL, this.usuario, this.clave);
        //ADDED ON OCT 2018
        this.con = DriverManager.getConnection(this.databaseURL);
        // System.out.println("************* databaseURL from Modl_1_1.java 1 "+databaseURL);
        //ADDED ON OCT 2018 - END
    }

    public void disconect() {
        if (this.con != null) {
            try {
                this.con.close();
            } catch (SQLException ignore) {
            } finally {
                this.con = null;
            }
        }
    }

    public boolean isConnected() {
        return this.con != null;
    }

    public String getJdbcDriver() {
        return this.jdbcDriver;
    }

    public void setJdbcDriver(String jdbcDriver) {
        this.jdbcDriver = jdbcDriver;
    }

    public String getDatabaseURL() {
        return this.databaseURL;
    }

    public void setDatabaseURL(String databaseURL) {
        this.databaseURL = databaseURL;
    }

    public String getUsuario() {
        return this.usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public String getClave() {
        return this.clave;
    }

    public void setClave(String clave) {
        this.clave = clave;
    }

    public String getError() {
        return this.Error;
    }

    public void setError(String Error) {
        this.Error = Error;
    }

    public String getAccion() {
        return this.accion;
    }

    public void setAccion(String accion) {
        this.accion = accion;
    }

    public String EsCiudad(String codigo)
            throws SQLException {
        if (!isConnected()) {
            throw new SQLException("Sin Conexion");
        }
        String retorno = "";

        ResultSet rs = null;
        String SQL = "Select ciusnombre from ciudades where ciuscodigo=?";

        PreparedStatement Buscar = this.con.prepareStatement(SQL);
        try {
            Buscar.setString(1, codigo);

            rs = Buscar.executeQuery();

            while (rs.next()) {
                retorno = rs.getString(1);
            }

        } finally {
            if (rs != null) {
                rs.close();
            }
        }
        return retorno;
    }

    public String getNorigen() {
        return this.norigen;
    }

    public String getNdestino() {
        return this.ndestino;
    }

    public void setNorigen(String norigen) {
        this.norigen = norigen;
    }

    public void setNdestino(String ndestino) {
        this.ndestino = ndestino;
    }

    public Usuarios getUsuarios() {
        return this.usr;
    }

    public int BuscarUsuariosIntranet(String usuario, String pwd)
            throws SQLException {
        int retorno = 0;
        if (!isConnected()) {
            throw new SQLException("Sin Conexion");
        }

        if (usuario == null) {
            retorno = 0;
        }

        Usuarios usuarios = null;

        ResultSet rs = null;
        ResultSet rs1 = null;
        String SQL = "Select usrsnombre,usrsclave,usrsgrupo,usrssucursal,usrstipo,suciver,usrsnomcompleto ,usulfactura,usulguia from usuarios join sucursales on usrssucursal=sucscodigo where usrsnombre=? and usrsclave=? ";

        PreparedStatement Buscar = this.con.prepareStatement(SQL);
        try {
            Buscar.setString(1, usuario.trim());
            Buscar.setString(2, pwd.trim());
            rs = Buscar.executeQuery();

            while (rs.next()) {
                this.usr = Usuarios.load(rs);
                retorno = 1;
            }

        } finally {
            if (rs != null) {
                rs.close();
            }
        }

        return retorno;
    }

    public Calendar TimestamptoCalendar(Timestamp Fecha) {
        Calendar fecha = Calendar.getInstance();
        fecha.setTime(Fecha);
        return fecha;
    }

    public static Timestamp toTimestamp(Date d) {
        return d == null ? null : new Timestamp(d.getTime());
    }

    public void setDesde(Timestamp desde) {
        this.desde = desde;
    }

    public Timestamp getDesde() {
        return this.desde;
    }

    public void setHasta(Timestamp hasta) {
        this.hasta = hasta;
    }

    public Timestamp getHasta() {
        return this.hasta;
    }

    public static Date Ultimo(int mes, int anio) {
        int dia = 31;

        if ((mes == 4) || (mes == 6) || (mes == 9) || (mes == 11)) {
            dia = 30;
        } else {
            if ((mes == 2) && (anio / 4 != Math.floor(anio / 4))) {
                dia = 28;
            }
            if ((mes == 2) && (anio / 4 == Math.floor(anio / 4))) {
                dia = 29;
            }

        }

        Date Retorna = new Date(anio, mes, dia);
        return Retorna;
    }

    public static int Dia(int mes, int anio) {
        int dia = 31;

        if ((mes == 4) || (mes == 6) || (mes == 9) || (mes == 11)) {
            dia = 30;
        } else {
            if ((mes == 2) && (anio / 4 != Math.floor(anio / 4))) {
                dia = 28;
            }
            if ((mes == 2) && (anio / 4 == Math.floor(anio / 4))) {
                dia = 29;
            }

        }

        Date Retorna = new Date(anio, mes, dia);
        return dia;
    }

    public long Traersecuencialvuelo(long reserva, long programacion)
            throws SQLException {
        if (!isConnected()) {
            throw new SQLException("Sin Conexion");
        }
        String SQL = "select vuellsecuencial from vuelos  where reslsecuencial=? and prolsecuencial=? ";

        PreparedStatement Buscar = this.con.prepareStatement(SQL);

        long retorno = 0L;
        ResultSet rs = null;
        try {
            Buscar.setLong(1, reserva);
            Buscar.setLong(2, programacion);
            rs = Buscar.executeQuery();

            while (rs.next()) {
                retorno = rs.getLong(1);
            }

        } finally {
            if (rs != null) {
                rs.close();
            }
        }
        return retorno;
    }

    public void BuscarUsuarios()
            throws SQLException {
        if (!isConnected()) {
            throw new SQLException("Sin Conexion");
        }
        String SQL = "select usrsnombre,usrsclave,usrssucursal,usrsgrupo,usrstipo,suciver,usrsnomcompleto ,usulfactura,usulguia from usuarios join sucursales on usrssucursal=sucscodigo order by usrsnombre ";

        PreparedStatement Buscar = this.con.prepareStatement(SQL);
        Usuarios usuario = null;
        this.lista = new LinkedList();
        ResultSet rs = null;
        try {
            rs = Buscar.executeQuery();

            while (rs.next()) {
                this.lista.add(Usuarios.load(rs));
            }

        } finally {
            if (rs != null) {
                rs.close();
            }
        }
    }

    public List getUsuariosl() {
        return this.lista;
    }

    public void BuscarUsuario(String nombre)
            throws SQLException {
        if (!isConnected()) {
            throw new SQLException("Sin Conexion");
        }
        String SQL = "select usrsnombre,usrsclave,usrsgrupo,usrssucursal,usrstipo,suciver,usrsnomcompleto ,usulfactura,usulguia from usuarios join sucursales on usrssucursal=sucscodigo where usrsnombre=? ";

        PreparedStatement Buscar = this.con.prepareStatement(SQL);
        Usuarios usuario = null;
        this.lista = new LinkedList();
        ResultSet rs = null;
        try {
            Buscar.setString(1, nombre);
            rs = Buscar.executeQuery();

            while (rs.next()) {
                this.lista.add(Usuarios.load(rs));
            }

        } finally {
            if (rs != null) {
                rs.close();
            }
        }
    }

    public List getSucursales() {
        return this.lista;
    }

    public void BuscarSucursales()
            throws SQLException {
        if (!isConnected()) {
            throw new SQLException("Sin Conexion");
        }
        String SQL = "select sucscodigo,sucsdescripcion,suciver,sucsserie,suclmanifiesto,sucguia,sucfactura,sucrangoguia,sucrangofactura from sucursales";
        PreparedStatement Buscar = this.con.prepareStatement(SQL);
        Sucursales sucursal = null;
        this.lista = new LinkedList();
        ResultSet rs = null;
        try {
            rs = Buscar.executeQuery();

            while (rs.next()) {
                this.lista.add(Sucursales.load(rs));
            }

        } finally {
            if (rs != null) {
                rs.close();
            }
        }
    }

    public void BuscarSucursal(String codigo)
            throws SQLException {
        if (!isConnected()) {
            throw new SQLException("Sin Conexion");
        }
        String SQL = "select sucscodigo,sucsdescripcion,suciver,sucsserie,suclmanifiesto,sucguia,sucfactura,sucrangoguia,sucrangofactura from sucursales where sucscodigo=? ";
        PreparedStatement Buscar = this.con.prepareStatement(SQL);
        Sucursales sucursal = null;
        this.lista = new LinkedList();
        ResultSet rs = null;
        try {
            Buscar.setString(1, codigo);
            rs = Buscar.executeQuery();

            while (rs.next()) {
                this.lista.add(Sucursales.load(rs));
            }

        } finally {
            if (rs != null) {
                rs.close();
            }
        }
    }

    public void BuscarClientesCarga(String parametro)
            throws SQLException {
        if (!isConnected()) {
            throw new SQLException("Sin Conexion");
        }
        //System.out.println("uhasd00");
        String SQL = "";

        if (parametro.equals("*")) {
            SQL = "select clilcodigo,clisnombre,clisdireccion,clisciudad, clistelefono,clisruc,cliccredito, clisvendedor,clicsaldo,cliscodcuenta,cliscodigo, cliicontribuyente,clicdescuento,clicmindescuento,   cliidiagratis,clingratishasta,tipsnombre,clientescarga.tiplsecuencial , cliscontadocredito ,clicorreo from  clientescarga,tipostarifa where clientescarga.tiplsecuencial=tipostarifa.tiplsecuencial order by clisnombre";
        } else {
            SQL = "select clilcodigo,clisnombre,clisdireccion,clisciudad, clistelefono,clisruc,cliccredito, clisvendedor,clicsaldo,cliscodcuenta,cliscodigo, cliicontribuyente,clicdescuento,clicmindescuento,   cliidiagratis,clingratishasta,tipsnombre,clientescarga.tiplsecuencial , cliscontadocredito ,clicorreo from  clientescarga,tipostarifa where clientescarga.tiplsecuencial=tipostarifa.tiplsecuencial and cliscontadocredito=? order by clisnombre";
        }
        //System.out.println("KLJia900"+SQL);
        PreparedStatement Buscar = this.con.prepareStatement(SQL);
        Clientesc clientec = null;

        this.Listaclic = new LinkedList();
        ResultSet rs = null;
        try {
            if (!parametro.equals("*")) {
                Buscar.setString(1, parametro);
            }
            rs = Buscar.executeQuery();

            while (rs.next()) {
                this.Listaclic.add(Clientesc.load(rs));
            }

        } finally {
            if (rs != null) {
                rs.close();
            }
        }
    }

    /**
     * a;adido por wagner y milton 08/02/2017 es para ver los menus de facturas
     * o guias sin los eliminados
     *
     * @param parametro
     * @throws SQLException
     */
    public void BuscarClientesCarga_sinEliminados(String parametro)
            throws SQLException {
        if (!isConnected()) {
            throw new SQLException("Sin Conexion");
        }
        String SQL = "";
        //System.out.println("ish900");
        if (parametro.equals("*")) {
            SQL = "select clilcodigo,Clisnombre,clisdireccion,clisciudad, clistelefono,clisruc,cliccredito, clisvendedor,clicsaldo,cliscodcuenta,cliscodigo, cliicontribuyente,clicdescuento,clicmindescuento,   cliidiagratis,clingratishasta,tipsnombre,clientescarga.tiplsecuencial , cliscontadocredito ,clicorreo from  clientescarga,tipostarifa where Upper(tipsnombre) not like '%ELIMINAR%' and clientescarga.tiplsecuencial=tipostarifa.tiplsecuencial order by clisnombre";
        } else {
            SQL = "select clilcodigo,CLisnombre,clisdireccion,clisciudad, clistelefono,clisruc,cliccredito, clisvendedor,clicsaldo,cliscodcuenta,cliscodigo, cliicontribuyente,clicdescuento,clicmindescuento,   cliidiagratis,clingratishasta,tipsnombre,clientescarga.tiplsecuencial , cliscontadocredito ,clicorreo from  clientescarga,tipostarifa where Upper(tipsnombre) not like '%ELIMINAR%' and clientescarga.tiplsecuencial=tipostarifa.tiplsecuencial and cliscontadocredito=? order by clisnombre";
        }
        //System.out.println("-----123sd-->"+SQL);

        PreparedStatement Buscar = this.con.prepareStatement(SQL);
        Clientesc clientec = null;

        this.Listaclic = new LinkedList();
        ResultSet rs = null;
        try {
            if (!parametro.equals("*")) {
                Buscar.setString(1, parametro);
            }
            rs = Buscar.executeQuery();

            while (rs.next()) {
                this.Listaclic.add(Clientesc.load(rs));
            }

        } finally {
            if (rs != null) {
                rs.close();
            }
        }
    }

    public List getClientesCarga() {
        return this.Listaclic;
    }

    public void Guiaslista(int dia, int mes, int anio)
            throws SQLException {
        if (!isConnected()) {
            throw new SQLException("Sin Conexion");
        }

        String SQL1 = "select  gUIlcodigo,guilnumero,guidfecha,  guiipiezas,guinpeso,guiscontiene,guisremitente,guisdestinatario, guisruc,guistelefono,guincredito,clilcodigo,guissucursal,guiientregaen, guibentregadosino,fechagrabaentrega, usuarioentrega,guisobservacion,guisusuario, guinflete,guinedomicilio,guintransportea,guinseguro,guinotros,guindescuento,guiniva,guintotal, guiadecarga.prolsecuencial,guinpesovol,guinservicioa,guiihora,guiiminutos,guisguiafactura, guisdireccion,guisorigen,guisdestino,tiplsecuencial,'' as nombre,guindescuentop,guisestado  ,guistransito,guisserie, guinimpuio, guinimpgps, guinimpscy from guiadecarga  where guidfecha=? and  guisestado<>'X' order by guilnumero,guisorigen,guisdestino";

        PreparedStatement Buscar = this.con.prepareStatement(SQL1);

        Guias guia = null;
        //System.out.println("alex1>>>>");
        this.Lista = new LinkedList();
        ResultSet rs = null;

        Calendar fin = Calendar.getInstance();

        fin.set(anio, mes - 1, dia);

        Date fecha = fin.getTime();
        try {
            Buscar.setTimestamp(1, toTimestamp(fecha));

            rs = Buscar.executeQuery();

            while (rs.next()) {
                this.Lista.add(Guias.load(rs));
            }

        } finally {
            if (rs != null) {
                rs.close();
            }
        }
    }

    public void GuiasAFacturar(int cliente)
            throws SQLException {
        if (!isConnected()) {
            throw new SQLException("Sin Conexion");
        }

        String SQL1 = "select  gUIlcOdigo,guilnumero,guidfecha,  guiipiezas,guinpeso,guiscontiene,guisremitente,guisdestinatario, guisruc,guistelefono,guincredito,clilcodigo,guissucursal,guiientregaen, guibentregadosino,fechagrabaentrega, usuarioentrega,guisobservacion,guisusuario, guinflete,guinedomicilio,guintransportea,guinseguro,guinotros,guindescuento,guiniva,guintotal, guiadecarga.prolsecuencial,guinpesovol,guinservicioa,guiihora,guiiminutos,guisguiafactura, guisdireccion,guisorigen,guisdestino,tiplsecuencial,'' as nombre,guindescuentop,guisestado  ,guistransito,guisserie , guinimpuio, guinimpgps, guinimpscy from guiadecarga  where faclnumfactura=0  and guisestado<>'X' and guisguiafactura='G' and  clilcodigo=?  order by guilnumero,guisorigen,guisdestino";

        PreparedStatement Buscar = this.con.prepareStatement(SQL1);

        Guias guia = null;
        //System.out.println("alex2>>>>");
        this.Lista = new LinkedList();
        ResultSet rs = null;
        try {
            Buscar.setInt(1, cliente);

            rs = Buscar.executeQuery();

            while (rs.next()) {
                this.Lista.add(Guias.load(rs));
            }

        } finally {
            if (rs != null) {
                rs.close();
            }
        }
    }

    public void GuiasxFecha(int diad, int mesd, int aniod, int diah, int mesh, int anioh, int cliente, String tipo, String sucursal)
            throws SQLException {
        if (!isConnected()) {
            throw new SQLException("Sin Conexion");
        }

        String SQL1 = "select  guilCOdiGO,guilnumero,guidfecha,  guiipiezas,guinpeso,guiscontiene,guisremitente,guisdestinatario, guisruc,guistelefono,guincredito,clilcodigo,guissucursal,guiientregaen, guibentregadosino,fechagrabaentrega, usuarioentrega,guisobservacion,guisusuario, guinflete,guinedomicilio,guintransportea,guinseguro,guinotros,guindescuento,guiniva,guintotal, guiadecarga.prolsecuencial,guinpesovol,guinservicioa,guiihora,guiiminutos,guisguiafactura, guisdireccion,guisorigen,guisdestino,tiplsecuencial,'' as nombre,guindescuentop,guisestado  ,guistransito,guisserie , guinimpuio, guinimpgps, guinimpscy from guiadecarga  where guisguiafactura=? and guidfecha between ? and ? ";

        if (cliente != 0) {
            SQL1 = SQL1 + " and clilcodigo=?  ";
        }

        if (!sucursal.trim().equals("-1")) {
            SQL1 = SQL1 + " and guissucursal=?";
        }
        SQL1 = SQL1 + "order by guilnumero,guisorigen,guisdestino";

        PreparedStatement Buscar = this.con.prepareStatement(SQL1);

        Guias guia = null;
        //System.out.println("alex3>>>>");
        this.Lista = new LinkedList();
        ResultSet rs = null;

        Calendar fin = Calendar.getInstance();
        Calendar inicio = Calendar.getInstance();
        inicio.set(aniod, mesd - 1, diad);
        fin.set(anioh, mesh - 1, diah);
        Date fechad = inicio.getTime();

        Date fechah = fin.getTime();
        try {
            Buscar.setString(1, tipo.trim());
            Buscar.setTimestamp(2, toTimestamp(fechad));
            Buscar.setTimestamp(3, toTimestamp(fechah));
            if (cliente != 0) {
                Buscar.setInt(4, cliente);
            }
            if ((!sucursal.trim().equals("-1")) && (cliente != 0)) {
                Buscar.setString(5, sucursal.trim());
            }
            if ((!sucursal.trim().equals("-1")) && (cliente == 0)) {
                Buscar.setString(4, sucursal.trim());
            }

            rs = Buscar.executeQuery();

            while (rs.next()) {
                //System.out.println("alex9a>>>>");
                this.Lista.add(Guias.load(rs));
            }

        } finally {
            if (rs != null) {
                rs.close();
            }
        }
    }

    public void GrabarComisionCarga(String base, float valor, int codigo)
            throws SQLException {
        if (!isConnected()) {
            throw new SQLException("Sin Conexion");
        }
        String SQL = "insert into comisionescarga  (clilcodigo,comstarifabase,comncomision)  values (?,?,?)";

        PreparedStatement Insertar = this.con.prepareStatement(SQL);
        try {
            Insertar.setInt(1, codigo);
            Insertar.setString(2, base.toUpperCase());
            Insertar.setFloat(3, valor);
            Insertar.executeUpdate();
        } catch (SQLException e) {
            throw new SQLException("Error en la inserción de Comision Carga: " + e.getMessage());
        }
    }

    public void BuscarComisionesCarga(int codigo)
            throws SQLException {
        if (!isConnected()) {
            throw new SQLException("Sin Conexion");
        }
        String SQL = "select clilCODigo,comstarifabase,comncomision,comisecuencial   from comisionescarga where clilcodigo=? ";

        PreparedStatement Buscar = this.con.prepareStatement(SQL);
        Comision comision = null;
        //System.out.println("alex9b>>>>");
        this.Lista = new LinkedList();
        ResultSet rs = null;
        try {
            Buscar.setInt(1, codigo);
            rs = Buscar.executeQuery();

            while (rs.next()) {
                this.Lista.add(Comision.load(rs));
            }

        } finally {
            if (rs != null) {
                rs.close();
            }
        }
    }

    public List getContratosCarga() {
        return this.Lista;
    }
    /**
     * a;adido por wagner y milton
     */
    public float tarifa_usable;

    public int BuscarTarifaCargaxpeso(String continente, String Destino, float peso, int tipo, String Origen)
            throws SQLException {
        if (!isConnected()) {
            throw new SQLException("Sin Conexion");
        }
        String SQL = "select tarlsecuencial, tariminimo,tarntarifa, tarnvalorizacion,tarnseguro,tarniva,'' as tipsnombre,tarniniciorango, tarnfinrango,taricontinente,tiplsecuencial,tarivalorizfija,tarndescuento, fecha_creacion , fecha_modificacion from tarifascarga  where tiplsecuencial=?  and taricontinente=? and tarniniciorango<? and (tarnfinrango>=? or tarnfinrango=0 ) order by  tipsnombre,tarniniciorango,tarnfinrango  ";

        int retorno = -1;
        int registros = 0;

        if ((tipo == 1) && (continente.equals("F")) && ((Destino.equals("UIO")) || (Origen.equals("UIO")))) {
            tipo = 20;
        }
        PreparedStatement Buscar = this.con.prepareStatement(SQL);

        float total = peso;
        Tarifasc tarifac = null;
        //System.out.println("alex9d>>>>"+tarifac);
        this.Lista = new LinkedList();
        ResultSet rs = null;
        try {
            Buscar.setInt(1, tipo);
            Buscar.setString(2, continente);
            Buscar.setFloat(3, total);
            Buscar.setFloat(4, total);
            rs = Buscar.executeQuery();
            //System.out.println("watson1111.0>>>>>"+rs.toString());            
            registros = rs.getFetchSize();

            int i = 0;
            while (rs.next()) {
                this.tarifa_usable = rs.getFloat("tarntarifa");
                i++;
                if (i == 1) {
                    retorno = 1;
                    this.Lista.add(Tarifasc.load(rs));
                    continue;
                }
                if ((i != 2) || (!Origen.trim().equals("GPS"))) {
                    continue;
                }
                retorno = 1;
                this.Lista = null;
                this.Lista = new LinkedList();
                this.Lista.add(Tarifasc.load(rs));
            }

        } finally {
            if (rs != null) {
                rs.close();
            }
        }

        return retorno;
    }

    public void BuscarGuia(long codigo)
            throws SQLException {
        if (!isConnected()) {
            throw new SQLException("Sin Conexion");
        }
        String SQL = "select  guilcodiGO,GUilnumero,guidfecha,  guiipiezas,guinpeso,guiscontiene,guisremitente,guisdestinatario, guisruc,guistelefono,guincredito,clilcodigo,guissucursal,guiientregaen, guibentregadosino,fechagrabaentrega, usuarioentrega,guisobservacion,guisusuario, guinflete,guinedomicilio,guintransportea,guinseguro,guinotros,guindescuento,guiniva,guintotal, guiadecarga.prolsecuencial,guinpesovol,guinservicioa,guiihora,guiiminutos,guisguiafactura, guisdireccion,guisorigen,guisdestino,tiplsecuencial,'' as nombre,guindescuentop,guisestado   ,guistransito,guisserie, guinimpuio ,guinimpgps ,guinimpscy from guiadecarga  where guilcodigo=? Order by guilnumero desc";

        PreparedStatement Buscar = this.con.prepareStatement(SQL);

        Guias guia = null;
        //System.out.println("alex9s>>>>");
        this.Lista = new LinkedList();
        ResultSet rs = null;
        try {
            Buscar.setLong(1, codigo);

            rs = Buscar.executeQuery();

            while (rs.next()) {
                this.Lista.add(Guias.load(rs));
            }

        } finally {
            if (rs != null) {
                rs.close();
            }
        }
    }

    public void ModificaGuiaCarga(long codigo, String origen, String destino, String nvuelo, int dia, int mes, int anio, int nguia, int mese, int diae, int anioe, int piezas, float peso, String contiene, String remitente, String destinatario, float flete, float entregad, float tadicional, float sadicional, float seguros, long cliente, String observacion, long vueloi, float pesov, int tipo)
            throws SQLException {
        if (!isConnected()) {
            throw new SQLException("Sin Conexion");
        }
        String SQL = "update GUIadecargA  set guilnumero=?,guidfecha=?,guiipiezas=?,guinpeso=?,guiscontiene=?,guisremitente=?,guisdestinatario=?,guisruc=?,guistelefono=?,guincredito=?, clilcodigo=?,guissucursal=?,guiientregaen=?,guibentregadosino=?,guidfechaentregado=?, guisquienentrega=?,guisobservacion=?,guisusuario=?,guinflete=?,guinedomicilio=?, guintransportea=?,guinseguro=?,guinotros=?,guindescuento=?,guiniva=?,guintotal=?,prolsecuencial=?,guinpesovol=?,guinservicioa=?,guiitipo=?  where guilcodigo=?";

        PreparedStatement Insertar = this.con.prepareStatement(SQL);

        Calendar inicio = Calendar.getInstance();
        inicio.set(anio, mes - 1, dia);
        Date mifecha = inicio.getTime();

        Calendar fin = Calendar.getInstance();
        fin.set(anioe, mese - 1, diae);
        Date fecha = fin.getTime();

        Usuarios usuario = getUsuarios();

        int entregaen = 0;
        float total = 0.0F;
        float iva = 0.0F;
        float descuento = 0.0F;
        float otros = 0.0F;
        try {
            Insertar.setLong(1, nguia);
            Insertar.setTimestamp(2, toTimestamp(mifecha));
            Insertar.setInt(3, piezas);
            Insertar.setFloat(4, peso);
            Insertar.setString(5, contiene);
            Insertar.setString(6, remitente);
            Insertar.setString(7, destinatario);
            Insertar.setString(8, "RucX");
            Insertar.setString(9, "TelefonoX");
            Insertar.setFloat(10, 0.0F);
            Insertar.setLong(11, cliente);
            Insertar.setString(12, usuario.getSucursal());
            Insertar.setInt(13, entregaen);
            Insertar.setInt(14, 0);
            Insertar.setTimestamp(15, toTimestamp(fecha));
            Insertar.setString(16, usuario.getNombre());
            Insertar.setString(17, observacion);
            Insertar.setString(18, usuario.getNombre());
            Insertar.setFloat(19, flete);
            Insertar.setFloat(20, entregad);
            Insertar.setFloat(21, tadicional);
            Insertar.setFloat(22, seguros);
            Insertar.setFloat(23, otros);
            Insertar.setFloat(24, descuento);
            Insertar.setFloat(25, iva);
            Insertar.setFloat(26, total);
            Insertar.setLong(27, vueloi);
            Insertar.setFloat(28, pesov);
            Insertar.setFloat(29, sadicional);
            Insertar.setInt(30, tipo);
            Insertar.setLong(31, codigo);
            Insertar.executeUpdate();
        } catch (SQLException e) {
            throw new SQLException("Error en la actualización de Guiadecarga: " + e.getMessage());
        }
    }

    public String TraerContinenteono(String Origen, String Destino)
            throws SQLException {
        if (!isConnected()) {
            throw new SQLException("Sin Conexion");
        }
        String retorno = "D";
        String SQL = "select ciulcontinente   from ciudades where (ciuscodigo=? or ciuscodigo=?) and  ciulcontinente<>'D' ";

        PreparedStatement Buscar = this.con.prepareStatement(SQL);

        ResultSet rs = null;
        try {
            Buscar.setString(1, Origen.trim());
            Buscar.setString(2, Destino.trim());

            rs = Buscar.executeQuery();

            while (rs.next()) {
                retorno = rs.getString(1);
            }
            return retorno;
        } finally {
            if (rs != null) {
                rs.close();
            }
        }
//    return retorno;
    }

    public void guiaFacturaTemporal(GuiaDeCargaDTO dto) {
        this.Lista = new LinkedList();
        this.Lista.add(Guias.load(dto));
    }
    /**
     * aumentado por wagner y mylton solo en public GuiaDeCargaDTO
     * InsertaGuiaCargaCTemp
     */
    public String detalleOtros;

    public GuiaDeCargaDTO InsertaGuiaCargaCTemp(String Origen, String Destino, long nguia, int Mese, int Diae, int Anioe, int Piezas, float Peso, String Contiene, String Remitente, String Destinatario, float Flete, float Entregad, float Tadicional, float Sadicional, float Seguros, long cliente, String Observacion, long secvuelo, float Pesov, float descuento, String Telefono, String Ruc, int hora, int minutos, String direccion, int entregaen, String tipo, int ttarifa, float kgratis, String transito, String serie)
            throws SQLException {
        if (!isConnected()) {
            throw new SQLException("Sin Conexion");
        }
        GuiaDeCargaDTO dto = new GuiaDeCargaDTO();
        this.detalleOtros = "0";
        String SQL = "insert into guiadecarga(guilnumero,guidfecha,guiipiezas,guinpeso,guiscontiene, guisremitente,guisdestinatario,guisruc,guistelefono,guincredito, clilcodigo,guissucursal,guiientregaen, guisobservacion,guisusuario,guinflete,guinedomicilio, guintransportea,guinseguro,guinotros,guindescuento,guiniva, guintotal,prolsecuencial,guinpesovol,guinservicioa,guiihora, guiiminutos,guisdireccion,guisguiafactura,usuariorecibe,guisorigen, guisdestino,tiplsecuencial,guindescuentop,guistransito,guisserie, guinimpuio, guinimpgps, guinimpscy) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

        PreparedStatement Insertar = this.con.prepareStatement(SQL);
        Usuarios usuario = getUsuarios();
        float Pesoaux = 0.0F;
        float total = 0.0F;
        float viva = 0.0F;
        float otros = 0.0F;
        float suma = 0.0F;
        int vminimo = 0;
        float vtarifa = 0.0F;
        float vvalorizacion = 0.0F;
        float vseguro = 0.0F;
        float vdescuento = 0.0F;
        float descuentoaux = 0.0F;
        int nomultiplica = 0;
        int nomultiplicav = 0;
        int midia = -1;

        float impuesto = 0.0F;
        float otrosaux = 0.0F;
        float vtarifaux = 0.0F;
        float vvalorizacionaux = 0.0F;
        float vseguroaux = 0.0F;
        float sumaaux = 0.0F;

        // Por separación de impuestos
        float impUIO = 0.0F;
        float impGPS = 0.0F;
        float impSCY = 0.0F;
        ////////////////////////////////////////////////
        DecimalFormatSymbols simbolos = new DecimalFormatSymbols();
        simbolos.setDecimalSeparator('.');
        ////////////////////////////////////////////////
        DecimalFormat df = new DecimalFormat("#.##", simbolos);

        impuesto = TraeimpCiudad(Destino);

        List list = getTarifasCarga();

        if (list != null) {
            //System.out.println("david-t-null>>>");
            Iterator it = list.iterator();
            while (it.hasNext()) {
                Tarifasc tarifac = (Tarifasc) it.next();
                //System.out.println("david-t-null.2>>>"+tarifac);
                vminimo = tarifac.getMinimo();
                vtarifa = tarifac.getTarifa();
                vvalorizacion = tarifac.getValorizacion();
                //System.out.println("david-t-null.2>>>"+vvalorizacion);
                vseguro = tarifac.getSeguro();
                viva = tarifac.getIva() / 100.0F;
                nomultiplica = tarifac.getMinimo();
                nomultiplicav = tarifac.getValorizfija();
                descuento = tarifac.getDescuento();
            }

        }
        //Evaluacion de Peso, asignar a Pesoaux el mayor Peso o Pesov
        if (Pesov > Peso) {
            Pesoaux = Pesov;
        } else {
            Pesoaux = Peso;
        }
//		if (Pesov == 0.0F) {
//			Pesoaux = Peso;
//		} else {
//			Pesoaux = Pesov;
//		}
        if (kgratis >= Pesoaux) {
            descuento = 100.0F;
        } else if (kgratis > 0.0F) {
            vtarifaux = kgratis * vtarifa;
            //System.out.println("david5>>>");
            otrosaux = impuesto / 100.0F * vtarifaux;
            this.detalleOtros += ("+(-impuesto-" + impuesto + "/" + 100 + "* -vtarifaux-" + vtarifaux + ")");
            vvalorizacionaux = vvalorizacion * kgratis;
            vseguroaux = vseguro * kgratis;
            sumaaux = vtarifaux + vvalorizacionaux + vseguroaux + otrosaux;

            descuentoaux = sumaaux;
        }

        if (nomultiplica == 1) {
            vtarifa = vtarifa;
        } else {
            vtarifa = Pesoaux * vtarifa;

            if (nomultiplicav != 1) {
                vvalorizacion *= Pesoaux;
            }
            vseguro *= Pesoaux;
        }
        //System.out.println("*-/88988----54->"+impuesto);
        if (impuesto > 0.0F) {
            if (vvalorizacion == 0.0F) {
                //System.out.println("david7>>>");
                otros = impuesto / 100.0F * Pesoaux;
                this.detalleOtros += ("+(-impuesto-" + impuesto + "/" + 100 + "*-Pesoaux-" + Pesoaux + ")");
                // Por separación de impuestos
                if ("SCY".equals(Destino)) {
                    impSCY = impuesto / 100.0F * Pesoaux;
                }
            } else {
                //System.out.println("david7.2>>>");
                otros = vvalorizacion;
                this.detalleOtros += ("+(-vvalorizacion-" + vvalorizacion + ")");
            }

        } else {
            //System.out.println("david7.3>>>");
            otros = 0.0F;
            this.detalleOtros += ("+(-valor constante-" + 0 + ")");
        }
        /*
         * aumentado por wagner y david
         */
        if ("GPS".equalsIgnoreCase(Destino)) {
//            otros += 0.04F * Pesoaux;
//            impGPS += 0.04F * Pesoaux;
            otros += Float.parseFloat(df.format(0.04F * Pesoaux));
            this.detalleOtros += ("+(-valor constante-" + 0.04F + "*-Pesoaux-" + Pesoaux + ")");
            impGPS += Float.parseFloat(df.format(0.04F * Pesoaux));
        }
        if ("GPS".equalsIgnoreCase(Origen)) {
//            otros += 0.06F * Pesoaux;
//            impGPS += 0.06F * Pesoaux;
            otros += Float.parseFloat(df.format(0.06F * Pesoaux));
            this.detalleOtros += ("+(-valor constante-" + 0.04F + "*-Pesoaux-" + Pesoaux + ")");
            impGPS += Float.parseFloat(df.format(0.06F * Pesoaux));
        }
        if ("SCY".equalsIgnoreCase(Destino)) {
            //Cuando el peso (peso o pesovolumen) es menor a 4k se debe usar flete minimo de 2.6
            if(Pesoaux<4){
                impSCY = Float.parseFloat(df.format(0.02F * vtarifa));
                otros += Float.parseFloat(df.format(0.02F * vtarifa));
            }else{
                otros += Float.parseFloat(df.format(0.02F * Pesoaux))* this.tarifa_usable;
                this.detalleOtros += ("+(-valor constante-" + 0.02F + "*-Pesoaux-" + Pesoaux + ")");
                impSCY += Float.parseFloat(df.format(0.02F * Pesoaux)) * this.tarifa_usable;
            }
        }
        //SOLO se cobra impuesto con SCY como destino.......
//		if ("SCY".equalsIgnoreCase(Origen)) {
//                        otros += Float.parseFloat(df.format(0.02F * Pesoaux));
//                        this.detalleOtros+=("+(-valor constante-"+0.02F +"*-Pesoaux-"+ Pesoaux+")");
//			impSCY += Float.parseFloat(df.format(0.02F * Pesoaux))*this.tarifa_usable;
//		}
        if ("UIO".equalsIgnoreCase(Destino)) {
//            otros += 0.05F * Pesoaux;
//            impUIO += 0.05F * Pesoaux;
            otros += Float.parseFloat(df.format(0.055F * Pesoaux));
            this.detalleOtros += ("+(-valor constante-" + 0.055F + "*-Pesoaux-" + Pesoaux + ")");
            impUIO += Float.parseFloat(df.format(0.055F * Pesoaux));
        }
        if ("UIO".equalsIgnoreCase(Origen)) {
//            otros += 0.05F * Pesoaux;
//            impUIO += 0.05F * Pesoaux;
            otros += Float.parseFloat(df.format(0.055F * Pesoaux));

            this.detalleOtros += ("+(-valor constante-" + 0.055F + "*-Pesoaux-" + Pesoaux + ")");
            impUIO += Float.parseFloat(df.format(0.055F * Pesoaux));
        }

        suma = vtarifa + vvalorizacion + vseguro + Entregad + Tadicional;
        vdescuento = suma * (descuento / 100.0F);
        vdescuento += descuentoaux;
        if ((nomultiplicav == 1) && (descuento == 0.0F)) {
            vdescuento = vvalorizacion;
        }

        suma = suma + otros - vdescuento;
        viva *= suma;

        Calendar fin = Calendar.getInstance();
        fin.set(Anioe, Mese - 1, Diae);
        Date fecha = fin.getTime();

        total = suma + viva;
        try {

            dto.setGuilnumero(nguia);
            dto.setGuidfecha(fecha);
            dto.setGuiipiezas(Piezas);
            dto.setGuinpeso(Peso);
            dto.setGuiscontiene(Contiene);
            dto.setGuisremitente(Remitente);
            dto.setGuisdestinatario(Destinatario);
            dto.setGuisruc(Ruc);
            dto.setGuistelefono(Telefono);
            dto.setGuincredito(0.0F);
            dto.setClilcodigo(cliente);
            dto.setGuissucursal(usuario.getSucursal());
            dto.setGuiientregaen(entregaen);
            dto.setGuisobservacion(Observacion);
            dto.setGuisusuario(usuario.getNombre());
            dto.setGuinflete(vtarifa);
            dto.setGuinedomicilio(Entregad);
            dto.setGuintransportea(Tadicional);
            dto.setGuinseguro(vseguro);
            dto.setGuinotros(otros);
            dto.setGuindescuento(vdescuento);
            dto.setGuiniva(viva);

            dto.setGuintotal(total);
            dto.setProlsecuencial(secvuelo);
            dto.setGuinpesovol(Pesov);
            dto.setGuinservicioa(vvalorizacion);
            dto.setGuiihora(hora);
            dto.setGuiiminutos(minutos);
            dto.setGuisdireccion(direccion);
            dto.setGuisguiafactura(tipo);
            dto.setUsuariorecibe(usuario.getNombre());
            dto.setGuisorigen(Origen);
            dto.setGuisdestino(Destino);
            dto.setTiplsecuencial(ttarifa);
            dto.setGuindescuentop(descuento);
            dto.setGuistransito(transito);
            dto.setGuisserie(serie);
            dto.setGuinimpuio(impUIO);
            dto.setGuinimpgps(impGPS);
            dto.setGuinimpscy(impSCY);
            dto.setGuintarifaneta(this.tarifa_usable);

        } catch (Exception e) {
            throw new SQLException("Error en la inserción de Guias : " + e.getMessage());
        }

        String SQL2 = "update  usuarios ";
        if (tipo.equals("G")) {
            SQL2 = SQL2 + "set usulguia=? ";
        } else if (tipo.equals("F")) {
            SQL2 = SQL2 + "set usulfactura=? ";
        }
        SQL2 = SQL2 + " where usrsnombre=? ";
        if (tipo.equals("G")) {
            SQL2 = SQL2 + " and usulguia <= ? ";
        } else if (tipo.equals("F")) {
            SQL2 = SQL2 + " and usulfactura <= ? ";
        }
        PreparedStatement Actualizar = this.con.prepareStatement(SQL2);
        try {
            long miguia = nguia + 1L;
            Actualizar.setLong(1, miguia);
            Actualizar.setString(2, usuario.getNombre());
            Actualizar.setLong(3, miguia);
            Actualizar.executeUpdate();
        } catch (SQLException e) {
            throw new SQLException("Error en la BuSQUEDA: " + e.getMessage());
        }

        return dto;
    }

    public long InsertaGuiaCargaC(Long guilnumero, Date guidfecha, Integer guiipiezas, Float guinpeso,
            String guiscontiene, String guisremitente, String guisdestinatario, String guisruc,
            String guistelefono, Float guincredito, Long clilcodigo, String guissucursal,
            Integer guiientregaen, String guisobservacion, String guisusuario, Float guinflete,
            Float guinedomicilio, Float guintransportea, Float guinseguro, Float guinotros,
            Float guindescuento, Float guiniva, Float guintotal, Long prolsecuencial, Float guinpesovol,
            Float guinservicioa, Integer guiihora, Integer guiiminutos, String guisdireccion,
            String guisguiafactura, String usuariorecibe, String guisorigen, String guisdestino,
            Integer tiplsecuencial, Float guindescuentop, String guistransito, String guisserie,
            Float guinimpuio, Float guinimpgps, Float guinimpscy, Float guintarifaneta)
            throws SQLException {
        if (!isConnected()) {
            throw new SQLException("Sin Conexion");
        }
        //String SQL = "insert into guiadecarga(guilnumero,guidfecha,guiipiezas,guinpeso,guiscontiene, guisremitente,guisdestinatario,guisruc,guistelefono,guincredito, clilcodigo,guissucursal,guiientregaen, guisobservacion,guisusuario,guinflete,guinedomicilio, guintransportea,guinseguro,guinotros,guindescuento,guiniva, guintotal,prolsecuencial,guinpesovol,guinservicioa,guiihora, guiiminutos,guisdireccion,guisguiafactura,usuariorecibe,guisorigen, guisdestino,tiplsecuencial,guindescuentop,guistransito,guisserie) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
        String SQL = "insert  into      guiadeCarga(guilnumero,guidfecha,guiipiezas,guinpeso,guiscontiene, guisremitente,guisdestinatario,guisruc,guistelefono,guincredito, clilcodigo,guissucursal,guiientregaen, guisobservacion,guisusuario,guinflete,guinedomicilio, guintransportea,guinseguro,guinotros,guindescuento,guiniva, guintotal,prolsecuencial,guinpesovol,guinservicioa,guiihora, guiiminutos,guisdireccion,guisguiafactura,usuariorecibe,guisorigen, guisdestino,tiplsecuencial,guindescuentop,guistransito,guisserie, guinimpuio, guinimpgps, guinimpscy,guintarifaneta) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

        PreparedStatement Insertar = this.con.prepareStatement(SQL);
        Usuarios usuario = getUsuarios();

        try {
            Insertar.setLong(1, guilnumero);
            Insertar.setTimestamp(2, toTimestamp(guidfecha));
            Insertar.setInt(3, guiipiezas);
            Insertar.setFloat(4, guinpeso);
            Insertar.setString(5, guiscontiene);
            Insertar.setString(6, guisremitente);
            Insertar.setString(7, guisdestinatario);
            Insertar.setString(8, guisruc);
            Insertar.setString(9, guistelefono);
            Insertar.setFloat(10, guincredito);
            Insertar.setLong(11, clilcodigo);
            Insertar.setString(12, guissucursal);
            Insertar.setInt(13, guiientregaen);
            Insertar.setString(14, guisobservacion);
            Insertar.setString(15, guisusuario);
            Insertar.setFloat(16, guinflete);
            Insertar.setFloat(17, guinedomicilio);
            Insertar.setFloat(18, guintransportea);
            Insertar.setFloat(19, guinseguro);
            Insertar.setFloat(20, guinotros);
            Insertar.setFloat(21, guindescuento);
            Insertar.setFloat(22, guiniva);
            Insertar.setFloat(23, guintotal);
            Insertar.setLong(24, prolsecuencial);
            Insertar.setFloat(25, guinpesovol);
            Insertar.setFloat(26, guinservicioa);
            Insertar.setInt(27, guiihora);
            Insertar.setInt(28, guiiminutos);
            Insertar.setString(29, guisdireccion);
            Insertar.setString(30, guisguiafactura);
            Insertar.setString(31, usuariorecibe);
            Insertar.setString(32, guisorigen);
            Insertar.setString(33, guisdestino);
            Insertar.setInt(34, tiplsecuencial);
            Insertar.setFloat(35, guindescuentop);
            Insertar.setString(36, guistransito);
            Insertar.setString(37, guisserie);
            Insertar.setFloat(38, guinimpuio);
            Insertar.setFloat(39, guinimpgps);
            Insertar.setFloat(40, guinimpscy);
            Insertar.setFloat(41, guintarifaneta);

            Insertar.executeUpdate();

            long guia = BuscarGuiaNumeroS(guilnumero, guisguiafactura);
            if (guisguiafactura.equals("G")) {
                GrabarPagosCarga(guia, "CR", "", guintotal);
                actualizarGuiaFacturaSucursal(guisserie, guilnumero, TIPO_G);
            } else if (guisguiafactura.equals("F")) {
                GrabarPagosCarga(guia, "EF", "", guintotal);
                actualizarGuiaFacturaSucursal(guisserie, guilnumero, TIPO_F);
            }

        } catch (SQLException e) {
            throw new SQLException("Error en la inserción de Guias : " + e.getMessage());
        }

        String SQL2 = "update  usuarios ";
        if (guisguiafactura.equals("G")) {
            SQL2 = SQL2 + "set usulguia=? ";
        } else if (guisguiafactura.equals("F")) {
            SQL2 = SQL2 + "set usulfactura=? ";
        }
        SQL2 = SQL2 + " where usrsnombre=? ";
        if (guisguiafactura.equals("G")) {
            SQL2 = SQL2 + " and usulguia <= ? ";
        } else if (guisguiafactura.equals("F")) {
            SQL2 = SQL2 + " and usulfactura <= ? ";
        }
        PreparedStatement Actualizar = this.con.prepareStatement(SQL2);
        try {
            long miguia = guilnumero + 1L;
            Actualizar.setLong(1, miguia);
            Actualizar.setString(2, usuario.getNombre());
            Actualizar.setLong(3, miguia);
            Actualizar.executeUpdate();
        } catch (SQLException e) {
            throw new SQLException("Error en la BuSQUEDA: " + e.getMessage());
        }

        return guilnumero;
    }

    public long BuscarGuiaNumero(long codvuelo, long numero)
            throws SQLException {
        if (!isConnected()) {
            throw new SQLException("Sin Conexion");
        }
        long retorno = -1L;
        String SQL = "Select guilcodigo    from guiadecarga join programacion on guiadecarga.prolsecuencial=programacion.prolsecuencial   where  programacion.prolsecuencial=?  and  guilnumero=?";

        PreparedStatement Buscar = this.con.prepareStatement(SQL);

        ResultSet rs = null;
        try {
            Buscar.setLong(1, codvuelo);
            Buscar.setLong(2, numero);

            rs = Buscar.executeQuery();

            while (rs.next()) {
                retorno = rs.getLong(1);
            }
            return retorno;
        } finally {
            if (rs != null) {
                rs.close();
            }
        }
//    return retorno;
    }

    public long BuscarGuiaNumeroS(long numero, String tipo)
            //wagner
            throws SQLException {
        if (!isConnected()) {
            throw new SQLException("Sin Conexion");
        }
        long retorno = -3L;
        Usuarios usuario = getUsuarios();
        String suc = usuario.getSucursal();
        //guisguiafactura = 'G' and 
        //String SQL = "Select guilcodigo    from guiadecarga    where  guissucursal=?  and  guilnumero=?";
        String SQL = "Select guilcodigo    from guiadecarga    where   guissucursal=?  and  guilnumero=?  and guisguiafactura = ?";

        PreparedStatement Buscar = this.con.prepareStatement(SQL);

        ResultSet rs = null;
        try {
            Buscar.setString(1, suc);
            Buscar.setLong(2, numero);
            Buscar.setString(3, tipo);
            //System.out.println("wwwwwwwwwwwww1>>>>>>>>>" + Buscar);
            rs = Buscar.executeQuery();

            while (rs.next()) {
                retorno = rs.getLong(1);
            }
            return retorno;
        } finally {
            if (rs != null) {
                rs.close();
            }
        }
        //   return retorno;
    }

    public void ModificaGuiaCargaC(long codigo, String origen, String destino, int mese, int diae, int anioe, int piezas, float peso, String contiene, String remitente, String destinatario, float flete, float Entregad, float Tadicional, float sadicional, float seguros, long cliente, String observacion, long vueloi, float Pesov, float descuento, int hora, int minutos, String Telefono, String Ruc, String tipo, String direccion, int entregaen, int ttarifa, float kgratis, String transito)
            throws SQLException {
        if (!isConnected()) {
            throw new SQLException("Sin Conexion");
        }
        String SQL = "upDATE guiadecarGa  set guidfecha=?,guiipiezas=?,guinpeso=?,guiscontiene=?,guisremitente=?,guisdestinatario=?,guisruc=?,guistelefono=?,guincredito=?, clilcodigo=?,guissucursal=?,guiientregaen=?,guibentregadosino=?,fechagrabaentrega=?, guisobservacion=?,guisusuario=?,guinflete=?,guinedomicilio=?, guintransportea=?,guinseguro=?,guinotros=?,guindescuento=?,guiniva=?,guintotal=?,prolsecuencial=?,guinpesovol=?,guinservicioa=? ,guiihora=?,guiiminutos=?,guisdireccion=?,guisorigen=?,guisdestino=?,tiplsecuencial=?,guindescuentop=?,guistransito=?  where guilcodigo=?";

        PreparedStatement Insertar = this.con.prepareStatement(SQL);

        Calendar fin = Calendar.getInstance();
        fin.set(anioe, mese - 1, diae);
        Date fecha = fin.getTime();
        Usuarios usuario = getUsuarios();
        float total = 0.0F;
        float descuentop = 0.0F;
        float vdescuento = 0.0F;
        float otros = 0.0F;
        float vminimo = 0.0F;
        float vtarifa = 0.0F;
        float vvalorizacion = 0.0F;
        float vseguro = 0.0F;
        float viva = 0.0F;
        float suma = 0.0F;
        int nomultiplica = 0;
        int nomultiplicav = 0;
        float Pesoaux = 0.0F;
        float impuesto = 0.0F;
        float vtarifaux = 0.0F;
        float otrosaux = 0.0F;
        float vvalorizacionaux = 0.0F;
        float vseguroaux = 0.0F;
        float sumaaux = 0.0F;
        float descuentoaux = 0.0F;

        float sumaaux2 = 0.0F;

        impuesto = TraeimpCiudad(destino);

        List list = getTarifasCarga();
        if (list != null) {
            Iterator it = list.iterator();
            while (it.hasNext()) {
                Tarifasc tarifac = (Tarifasc) it.next();

                nomultiplica = tarifac.getMinimo();
                vtarifa = tarifac.getTarifa();
                vvalorizacion = tarifac.getValorizacion();
                vseguro = tarifac.getSeguro();
                viva = tarifac.getIva() / 100.0F;
                nomultiplicav = tarifac.getValorizfija();
                descuentop = tarifac.getDescuento();
            }
        }

        if (Pesov <= 0.0F) {
            Pesoaux = peso;
        } else {
            Pesoaux = Pesov;
        }

        if (kgratis > Pesoaux) {
            descuentop = 100.0F;
        } else if (kgratis > 0.0F) {
            vtarifaux = kgratis * vtarifa;
            otrosaux = impuesto / 100.0F * vtarifaux;
            vvalorizacionaux = vvalorizacion * kgratis;
            vseguroaux = vseguro * kgratis;
            sumaaux = vtarifaux + vvalorizacionaux + vseguroaux + otrosaux;

            descuentoaux = sumaaux;
        }

        if (nomultiplica == 1) {
            vtarifa = (vminimo + 1.0F) * vtarifa;
        } else {
            vtarifa = Pesoaux * vtarifa;

            if (nomultiplicav != 1) {
                vvalorizacion *= Pesoaux;
            }
            vseguro *= Pesoaux;
        }

        if (impuesto > 0.0F) {
            if (vvalorizacion == 0.0F) {
                otros = impuesto / 100.0F * Pesoaux;
            } else {
                otros = vvalorizacion;
            }
        } else {
            otros = 0.0F;
        }

        suma = vtarifa + vvalorizacion + vseguro + Entregad + Tadicional;
        sumaaux2 = vtarifa + vvalorizacion + vseguro + Entregad + Tadicional;

        vdescuento = sumaaux2 * (descuentop / 100.0F);

        if ((nomultiplicav == 1) && (descuentop == 0.0F)) {
            vdescuento = vvalorizacion;
        }
        vdescuento += descuentoaux;

        suma = suma - vdescuento + otros;
        viva *= suma;
        total = suma + viva;
        try {
            Insertar.setTimestamp(1, toTimestamp(fecha));
            Insertar.setInt(2, piezas);
            Insertar.setFloat(3, peso);

            Insertar.setString(4, contiene);
            Insertar.setString(5, remitente);
            Insertar.setString(6, destinatario);
            Insertar.setString(7, Ruc);
            Insertar.setString(8, Telefono);
            Insertar.setFloat(9, 0.0F);
            Insertar.setLong(10, cliente);
            Insertar.setString(11, usuario.getSucursal());
            Insertar.setInt(12, entregaen);
            Insertar.setInt(13, 0);
            Insertar.setTimestamp(14, toTimestamp(fecha));

            Insertar.setString(15, observacion);
            Insertar.setString(16, usuario.getNombre());
            Insertar.setFloat(17, vtarifa);
            Insertar.setFloat(18, Entregad);
            Insertar.setFloat(19, Tadicional);
            Insertar.setFloat(20, vseguro);
            Insertar.setFloat(21, otros);
            Insertar.setFloat(22, vdescuento);
            Insertar.setFloat(23, viva);
            Insertar.setFloat(24, total);
            Insertar.setLong(25, vueloi);
            Insertar.setFloat(26, Pesov);

            Insertar.setFloat(27, vvalorizacion);
            Insertar.setInt(28, hora);
            Insertar.setInt(29, minutos);
            Insertar.setString(30, direccion);
            Insertar.setString(31, origen);
            Insertar.setString(32, destino);
            Insertar.setInt(33, ttarifa);
            Insertar.setFloat(34, descuentop);
            Insertar.setString(35, transito);
            Insertar.setLong(36, codigo);
            Insertar.executeUpdate();
        } catch (SQLException e) {
            throw new SQLException("Error en la actualización de Guiadecarga: " + e.getMessage());
        }
    }

    public void GrabarPagosCarga(long codigo, String tipo, String Observacion, float valor)
            throws SQLException {
        if (!isConnected()) {
            throw new SQLException("Sin Conexion");
        }
        String SQL = "insert into pagoscarga  (pagstipo, guilcodigo,pagnvalor,pagsobservaciones) values(?,?,?,?)";

        PreparedStatement Insertar = this.con.prepareStatement(SQL);
        try {
            Insertar.setString(1, tipo.trim());
            Insertar.setLong(2, codigo);
            Insertar.setFloat(3, valor);
            Insertar.setString(4, Observacion);
            Insertar.executeUpdate();
        } catch (SQLException e) {
            throw new SQLException("Error en la inserción de Pagos Carga: " + e.getMessage());
        }
    }

    public void GrabarPagosCargaTarjetas(long codigo, String tipo, String Observacion, float valor,String franquicia,String banco,String vence,String four,String numberAuth)
            throws SQLException {
        if (!isConnected()) {
            throw new SQLException("Sin Conexion");
        }
        long idPagoCarga = 0;
        String SQL = "insert into pagoscarga  (pagstipo, guilcodigo,pagnvalor,pagsobservaciones) values(?,?,?,?)";
        //String SQL_Selectidpago = "SELECT CURRVAL('pagoscarga_paglsecuencial_seq')";
        String SQL_Selectidpago = "SELECT MAX(paglsecuencial) FROM pagoscarga";
        String SQL_InsertDet = "INSERT INTO detalletarjetacobro(detbanco, detfranquicia, detpagocarga, fecha_vencimiento, ultimosdigitos, numero_autorizacion) VALUES (?, ?, ?, ?, ?, ?)";
        
        PreparedStatement Insertar = this.con.prepareStatement(SQL);
        Statement Select = con.createStatement();
        //PreparedStatement Select = this.con.prepareStatement(SQL_Selectidpago);
        PreparedStatement InsertarDet = this.con.prepareStatement(SQL_InsertDet);
        try {
            Insertar.setString(1, tipo.trim());
            Insertar.setLong(2, codigo);
            Insertar.setFloat(3, valor);
            Insertar.setString(4, Observacion);
            int nrow= Insertar.executeUpdate();
            ResultSet rs = null;
            if(nrow>0){
                rs =Select.executeQuery(SQL_Selectidpago);
                    while (rs.next()) {
                    idPagoCarga =rs.getLong(1);
                }
                if(idPagoCarga!=0){
                    InsertarDet.setString(1,banco );
                    InsertarDet.setString(2,franquicia );
                    InsertarDet.setLong(3,idPagoCarga );
                    InsertarDet.setString(4,vence );
                    InsertarDet.setString(5,four );
                    InsertarDet.setString(6,numberAuth );
                    InsertarDet.executeUpdate();
                }
            }
//            ResultSet  rs = Insertar.getGeneratedKeys();
//            if(rs.next()){
//                long codId=rs.getLong(1);
//            }
        } catch (SQLException e) {
            throw new SQLException("Error en la inserción de Pagos Carga: " + e.getMessage());
        }
    } 
   
    
    public void BuscarPagoCarga(long codigo)
            throws SQLException {
        if (!isConnected()) {
            throw new SQLException("Sin Conexion");
        }
        String SQL = "Select pagstipo,  pagsdocumento,  pagsobservaciones,pagnvalor   from pagoscarga  where guilcodigo=? ";

        PreparedStatement Buscar = this.con.prepareStatement(SQL);

        Pagosc pagoc = null;

        this.Lista2 = new LinkedList();
        ResultSet rs = null;
        try {
            Buscar.setLong(1, codigo);
            rs = Buscar.executeQuery();

            while (rs.next()) {
                this.Lista2.add(Pagosc.load(rs));
            }

        } finally {
            if (rs != null) {
                rs.close();
            }
        }
    }
    
    public void BuscarDetallePagosTarjeta(long codigo)
        throws SQLException {
        if (!isConnected()) {
            throw new SQLException("Sin Conexion");
        }
        String SQL = "SELECT id_detalletarjeta, detbanco, detfranquicia, detpagocarga, fecha_vencimiento, ultimosdigitos,numero_autorizacion, numero_cierre, observaciones_cierre, downloaded,pagstipo,pagnvalor FROM detalletarjetacobro JOIN pagoscarga ON paglsecuencial = detpagocarga where guilcodigo=?";

        PreparedStatement Buscar = this.con.prepareStatement(SQL);

        this.ListaDetTarj = new LinkedList();
        ResultSet rs = null;
        try {
            Buscar.setLong(1, codigo);
            rs = Buscar.executeQuery();

            while (rs.next()) {
                this.ListaDetTarj.add(DetalleCobroTarjeta.loadFull(rs));
            }

        } finally {
            if (rs != null) {
                rs.close();
            }
        }
    }

    public List getPagosCarga() {
        return this.Lista2;
    }
    
    public List getDetPagosTarjetas(){
        return this.ListaDetTarj;
    }

    public void BorraPagosCarga(long numero)
            throws SQLException {
        if (!isConnected()) {
            throw new SQLException("Sin Conexion");
        }
        //System.out.println("asdasdjmasd2228-+*");
        String deleteDet ="delete from detalletarjetacobro where detpagocarga in(select paglsecuencial from detalletarjetacobro join pagoscarga on detpagocarga = paglsecuencial where guilcodigo=?)";
        String SQL = "delete from pagoscarga where guilcodigo=? and pagstipo<>'' and pagnvalor<>0 ";

        PreparedStatement deleteDetalleTarjeta = this.con.prepareStatement(deleteDet);
        PreparedStatement Insertar = this.con.prepareStatement(SQL);
        Usuarios usuario = getUsuarios();
        try {
            deleteDetalleTarjeta.setLong(1,numero);
            deleteDetalleTarjeta.executeUpdate();
            Insertar.setLong(1, numero);
            Insertar.executeUpdate();
        } catch (SQLException e) {
            throw new SQLException("Error en el borrado de Pagos: " + e.getMessage());
        }
    }

    public void BuscarRepventasC(String sucursal, String codigo, int dia, int mes, int anio, String documento)
            throws SQLException {
        if (!isConnected()) {
            throw new SQLException("Sin Conexion");
        }
        String SQL;
        // String SQL;
        //System.out.println("iasdho9");
        if (sucursal.equals("-1")) {
            SQL = " select  gUIadecarga.guilCOdigo,max(guilnumero),max(guisorigen),max(guisdestino), max(guinflete),max(guinedomicilio),max(guinservicioa),max(guinseguro),max(guindescuento),max(guiniva),max(guintotal),max(pagstipo),sum(pagnvalor), max(guisobservacion),max(guisusuario),  sum(case when pagstipo='EF' THEN pagnvalor else 0 end), sum(case when pagstipo='CR' THEN pagnvalor else 0 end), sum(case when pagstipo='RT' THEN pagnvalor else 0 end),clisnombre,max(guinpesovol),max(guinpeso),max(guisestado),max(guinotros),max(pagdtfecha),max(guinimpuio), max(guinimpgps), max(guinimpSCY), max(guintarifaneta) from  guiadecarga join clientescarga on guiadecarga.clilcodigo=clientescarga.clilcodigo   join pagoscarga on guiadecarga.guilcodigo= pagoscarga.guilcodigo  where  guilnumero>0  and guisusuario=? and  pagdtfecha=? and guisguiafactura=? group by guiadecarga.guilcodigo,clisnombre union select guilcodigo,guilnumero,'' as guisorigen,'' as guisdestino, guinflete,guinedomicilio,guinservicioa,guinseguro,guindescuento, guiniva,guintotal,'' as pastipo,0 as pagnvalor, guisobservacion,guisusuario, 0 as efectivo,0 as credito,0 as retencion,'' as clisnombre,guinpesovol,guinpeso,guisestado,guinotros,guidfecha,guinimpuio as impUIO, guinimpgps as impGPS, guinimpSCY as impSCY , guintarifaneta as tarifaneta from guiadecarga  where  guilnumero>0  and guisusuario=? and  guidfecha=? and guisestado='X' and guisguiafactura=? order by 2";
        } else {
            SQL = " select  guiadecarga.guilCOdiGO,mAx(guilnumero),max(guisorigen),max(guisdestino), max(guinflete),max(guinedomicilio),max(guinservicioa),max(guinseguro),max(guindescuento),max(guiniva),max(guintotal),max(pagstipo),sum(pagnvalor), max(guisobservacion),max(guisusuario),  sum(case when pagstipo='EF' THEN pagnvalor else 0 end), sum(case when pagstipo='CR' THEN pagnvalor else 0 end), sum(case when pagstipo='RT' THEN pagnvalor else 0 end),clisnombre,max(guinpesovol),max(guinpeso),max(guisestado),max(guinotros),max(pagdtfecha),max(guinimpuio), max(guinimpgps), max(guinimpSCY) , max(guintarifaneta) from  guiadecarga join clientescarga on guiadecarga.clilcodigo=clientescarga.clilcodigo  join pagoscarga on guiadecarga.guilcodigo= pagoscarga.guilcodigo  where  guilnumero>0  and guissucursal=? and  pagdtfecha=? and guisguiafactura=? group by guiadecarga.guilcodigo,clisnombre union select guilcodigo,guilnumero,'' as guisorigen,'' as guisdestino, guinflete,guinedomicilio,guinservicioa,guinseguro,guindescuento, guiniva,guintotal,'' as pastipo,0 as pagnvalor, guisobservacion,guisusuario, 0 as efectivo,0 as credito,0 as retencion,'' as clisnombre,guinpesovol,guinpeso,guisestado,guinotros,guidfecha,guinimpuio as impUIO, guinimpgps as impGPS, guinimpSCY as impSCY , guintarifaneta as tarifaneta from guiadecarga  where  guilnumero>0  and guissucursal=? and guidfecha=? and guisestado='X' and guisguiafactura=? order by 2";
        }

        PreparedStatement Buscar = this.con.prepareStatement(SQL);

        Repventasc repventac = null;
//System.out.println("alex6y>>>>"+SQL);
        this.Lista = new LinkedList();

        ResultSet rs = null;

        Calendar fin = Calendar.getInstance();
        fin.set(anio, mes - 1, dia);
        Date fecha = fin.getTime();
        try {
            if (sucursal.equals("-1")) {
                Buscar.setString(1, codigo);
            } else {
                Buscar.setString(1, sucursal);
            }
            Buscar.setTimestamp(2, toTimestamp(fecha));
            Buscar.setString(3, documento);
            if (sucursal.equals("-1")) {
                Buscar.setString(4, codigo);
            } else {
                Buscar.setString(4, sucursal);
            }
            Buscar.setTimestamp(5, toTimestamp(fecha));
            Buscar.setString(6, documento);

            rs = Buscar.executeQuery();

            while (rs.next()) {
                //System.out.println("alex7z>>>>");
                this.Lista.add(Repventasc.load(rs));
            }

        } finally {
            if (rs != null) {
                rs.close();
            }
        }
    }
/**
 * Metodo para realizar el reporte de ventar , incluye ventas con tarjeta de credito y debito
 * @param sucursal
 * @param codigo
 * @param dia
 * @param mes
 * @param anio
 * @param documento
 * @throws SQLException 
 */
    public void buscarRepventasWTC(String sucursal, String codigo, int dia, int mes, int anio, String documento)
    throws SQLException{
  
        if (!isConnected()) {
            throw new SQLException("Sin Conexion");
        }
        String SQL;
        // String SQL;
        //System.out.println("iasdho9");
        if (sucursal.equals("-1")) {//guisusuario
            //SQL = " SELECT guiadecarga.guilcodigo, Max(guilnumero), Max(guisorigen), Max(guisdestino), Max(guinflete), Max(guinedomicilio), Max(guinservicioa), Max(guinseguro), Max(guindescuento), Max(guiniva), Max(guintotal), Max(pagstipo), SUM(pagnvalor), Max(guisobservacion), Max(guisusuario), SUM(CASE WHEN pagstipo = 'EF' THEN pagnvalor ELSE 0 END), SUM(CASE WHEN pagstipo = 'CR' THEN pagnvalor ELSE 0 END), SUM(CASE WHEN pagstipo = 'RT' THEN pagnvalor ELSE 0 END), clisnombre, Max(guinpesovol), Max(guinpeso), Max(guisestado), Max(guinotros), Max(pagdtfecha), Max(guinimpuio), Max(guinimpgps), Max(guinimpscy), Max(guintarifaneta), detbanco, detfranquicia, fecha_vencimiento , ultimosdigitos , numero_autorizacion, numero_cierre FROM   guiadecarga join clientescarga ON guiadecarga.clilcodigo = clientescarga.clilcodigo join pagoscarga ON guiadecarga.guilcodigo = pagoscarga.guilcodigo full outer join detalletarjetacobro ON paglsecuencial=detpagocarga WHERE  guilnumero > 0 AND guisusuario = ? AND pagdtfecha = ? AND guisguiafactura = ? GROUP  BY guiadecarga.guilcodigo, clisnombre, id_detalletarjeta, detbanco, detfranquicia,detpagocarga , fecha_vencimiento , ultimosdigitos , numero_autorizacion, numero_cierre UNION SELECT guiadecarga.guilcodigo, guilnumero, ''             AS guisorigen, ''             AS guisdestino, guinflete, guinedomicilio, guinservicioa, guinseguro, guindescuento, guiniva, guintotal, ''             AS pastipo, 0              AS pagnvalor, guisobservacion, guisusuario, 0              AS efectivo, 0              AS credito, 0              AS retencion, ''             AS clisnombre, guinpesovol, guinpeso, guisestado, guinotros, guidfecha, guinimpuio     AS impUIO, guinimpgps     AS impGPS, guinimpscy     AS impSCY, guintarifaneta AS tarifaneta, detbanco AS banco, detfranquicia AS franquicia, fecha_vencimiento AS vencimiento, ultimosdigitos AS ultimosdigitos, numero_autorizacion AS numeroAutorizacion, numero_cierre AS numeroCierre FROM   guiadecarga join pagoscarga ON guiadecarga.guilcodigo = pagoscarga.guilcodigo full outer join detalletarjetacobro ON paglsecuencial=detpagocarga WHERE  guilnumero > 0 AND guisusuario = ? AND guidfecha = ? AND guisestado = 'X' AND guisguiafactura = ? ORDER BY 2";
            SQL ="SELECT guiadecarga.guilcodigo, Max(guilnumero), Max(guisorigen), Max(guisdestino), Max(guinflete), Max(guinedomicilio), Max(guinservicioa), Max(guinseguro), Max(guindescuento), Max(guiniva), Max(guintotal), Max(pagstipo), Sum(pagnvalor), Max(guisobservacion), Max(guisusuario), Sum(CASE WHEN pagstipo = 'EF' THEN pagnvalor ELSE 0 END), Sum(CASE WHEN pagstipo = 'CR' THEN pagnvalor ELSE 0 END), Sum(CASE WHEN pagstipo = 'RT' THEN pagnvalor ELSE 0 END), Sum(CASE WHEN pagstipo = 'CH' THEN pagnvalor ELSE 0 END), Sum(CASE WHEN pagstipo = 'DC' THEN pagnvalor ELSE 0 END), Sum(CASE WHEN pagstipo = 'CC' THEN pagnvalor ELSE 0 END), clisnombre, Max(guinpesovol), Max(guinpeso), Max(guisestado), Max(guinotros), Max(pagdtfecha), Max(guinimpuio), Max(guinimpgps), Max(guinimpscy), Max(guintarifaneta), Max(CASE WHEN pagstipo = 'DC' THEN detbanco ELSE '' END), Max(CASE WHEN pagstipo = 'DC' THEN detfranquicia ELSE '' END), Max(CASE WHEN pagstipo = 'DC' THEN fecha_vencimiento ELSE '' END), Max(CASE WHEN pagstipo = 'DC' THEN ultimosdigitos ELSE '' END), Max(CASE WHEN pagstipo = 'DC' THEN numero_autorizacion ELSE '' END), Max(CASE WHEN pagstipo = 'CC' THEN detbanco ELSE '' END), Max(CASE WHEN pagstipo = 'CC' THEN detfranquicia ELSE '' END), Max(CASE WHEN pagstipo = 'CC' THEN fecha_vencimiento ELSE '' END), Max(CASE WHEN pagstipo = 'CC' THEN ultimosdigitos ELSE '' END), Max(CASE WHEN pagstipo = 'CC' THEN numero_autorizacion ELSE '' END), Max(numero_cierre) FROM   guiadecarga JOIN clientescarga ON guiadecarga.clilcodigo = clientescarga.clilcodigo JOIN pagoscarga ON guiadecarga.guilcodigo = pagoscarga.guilcodigo FULL OUTER JOIN detalletarjetacobro ON paglsecuencial = detpagocarga WHERE  guilnumero > 0 AND guisusuario = ? AND pagdtfecha = ? AND guisguiafactura = ? GROUP  BY guiadecarga.guilcodigo, clisnombre UNION SELECT guiadecarga.guilcodigo, guilnumero, '' AS guisorigen, '' AS guisdetino, guinflete, guinedomicilio, guinservicioa, guinseguro, guindescuento, guiniva, guintotal, '' AS pastipo, 0 AS pagnvalor, guisobservacion, guisusuario, 0 AS efectivo, 0 AS credito, 0 AS retencion, 0 AS cheque, 0 AS tdebito, 0 AS tcredito, '' AS clisnombre, guinpesovol, guinpeso, guisestado, guinotros, guidfecha, guinimpuio AS impUIO, guinimpgps AS impGPS, guinimpscy  AS impSCY, guintarifaneta AS tarifaneta, '' AS bancoTD, '' AS franquiciaTD, '' AS vencimientoTD, '' AS ultimosdigitosTD, '' AS numeroAutorizacionTD, '' AS bancoTC, '' AS franquiciaTC, '' AS vencimientoTC, '' AS ultimosdigitosTC, '' AS numeroAutorizacionTC, numero_cierre AS numeroCierre FROM   guiadecarga JOIN pagoscarga ON guiadecarga.guilcodigo = pagoscarga.guilcodigo FULL OUTER JOIN detalletarjetacobro ON paglsecuencial = detpagocarga WHERE  guilnumero > 0 AND guisusuario = ? AND guidfecha = ? AND guisestado = 'X' AND guisguiafactura = ?";
        } else { //guissucursal
           // SQL = " SELECT guiadecarga.guilcodigo, Max(guilnumero), Max(guisorigen), Max(guisdestino), Max(guinflete), Max(guinedomicilio), Max(guinservicioa), Max(guinseguro), Max(guindescuento), Max(guiniva), Max(guintotal), Max(pagstipo), SUM(pagnvalor), Max(guisobservacion), Max(guisusuario), SUM(CASE WHEN pagstipo = 'EF' THEN pagnvalor ELSE 0 END), SUM(CASE WHEN pagstipo = 'CR' THEN pagnvalor ELSE 0 END), SUM(CASE WHEN pagstipo = 'RT' THEN pagnvalor ELSE 0 END), clisnombre, Max(guinpesovol), Max(guinpeso), Max(guisestado), Max(guinotros), Max(pagdtfecha), Max(guinimpuio), Max(guinimpgps), Max(guinimpscy), Max(guintarifaneta), detbanco, detfranquicia, fecha_vencimiento , ultimosdigitos , numero_autorizacion, numero_cierre FROM   guiadecarga join clientescarga ON guiadecarga.clilcodigo = clientescarga.clilcodigo join pagoscarga ON guiadecarga.guilcodigo = pagoscarga.guilcodigo full outer join detalletarjetacobro ON paglsecuencial=detpagocarga WHERE  guilnumero > 0 AND guissucursal = ? AND pagdtfecha = ? AND guisguiafactura = ? GROUP  BY guiadecarga.guilcodigo, clisnombre, id_detalletarjeta, detbanco, detfranquicia,detpagocarga , fecha_vencimiento , ultimosdigitos , numero_autorizacion, numero_cierre UNION SELECT guiadecarga.guilcodigo, guilnumero, ''             AS guisorigen, ''             AS guisdestino, guinflete, guinedomicilio, guinservicioa, guinseguro, guindescuento, guiniva, guintotal, ''             AS pastipo, 0              AS pagnvalor, guisobservacion, guisusuario, 0              AS efectivo, 0              AS credito, 0              AS retencion, ''             AS clisnombre, guinpesovol, guinpeso, guisestado, guinotros, guidfecha, guinimpuio     AS impUIO, guinimpgps     AS impGPS, guinimpscy     AS impSCY, guintarifaneta AS tarifaneta, detbanco AS banco, detfranquicia AS franquicia, fecha_vencimiento AS vencimiento, ultimosdigitos AS ultimosdigitos, numero_autorizacion AS numeroAutorizacion, numero_cierre AS numeroCierre FROM   guiadecarga join pagoscarga ON guiadecarga.guilcodigo = pagoscarga.guilcodigo full outer join detalletarjetacobro ON paglsecuencial=detpagocarga WHERE  guilnumero > 0 AND guissucursal = ? AND guidfecha = ? AND guisestado = 'X' AND guisguiafactura = ? ORDER BY 2";
            SQL ="SELECT guiadecarga.guilcodigo, Max(guilnumero), Max(guisorigen), Max(guisdestino), Max(guinflete), Max(guinedomicilio), Max(guinservicioa), Max(guinseguro), Max(guindescuento), Max(guiniva), Max(guintotal), Max(pagstipo), Sum(pagnvalor), Max(guisobservacion), Max(guisusuario), Sum(CASE WHEN pagstipo = 'EF' THEN pagnvalor ELSE 0 END), Sum(CASE WHEN pagstipo = 'CR' THEN pagnvalor ELSE 0 END), Sum(CASE WHEN pagstipo = 'RT' THEN pagnvalor ELSE 0 END), Sum(CASE WHEN pagstipo = 'CH' THEN pagnvalor ELSE 0 END), Sum(CASE WHEN pagstipo = 'DC' THEN pagnvalor ELSE 0 END), Sum(CASE WHEN pagstipo = 'CC' THEN pagnvalor ELSE 0 END), clisnombre, Max(guinpesovol), Max(guinpeso), Max(guisestado), Max(guinotros), Max(pagdtfecha), Max(guinimpuio), Max(guinimpgps), Max(guinimpscy), Max(guintarifaneta), Max(CASE WHEN pagstipo = 'DC' THEN detbanco ELSE '' END), Max(CASE WHEN pagstipo = 'DC' THEN detfranquicia ELSE '' END), Max(CASE WHEN pagstipo = 'DC' THEN fecha_vencimiento ELSE '' END), Max(CASE WHEN pagstipo = 'DC' THEN ultimosdigitos ELSE '' END), Max(CASE WHEN pagstipo = 'DC' THEN numero_autorizacion ELSE '' END), Max(CASE WHEN pagstipo = 'CC' THEN detbanco ELSE '' END), Max(CASE WHEN pagstipo = 'CC' THEN detfranquicia ELSE '' END), Max(CASE WHEN pagstipo = 'CC' THEN fecha_vencimiento ELSE '' END), Max(CASE WHEN pagstipo = 'CC' THEN ultimosdigitos ELSE '' END), Max(CASE WHEN pagstipo = 'CC' THEN numero_autorizacion ELSE '' END), Max(numero_cierre) FROM   guiadecarga JOIN clientescarga ON guiadecarga.clilcodigo = clientescarga.clilcodigo JOIN pagoscarga ON guiadecarga.guilcodigo = pagoscarga.guilcodigo FULL OUTER JOIN detalletarjetacobro ON paglsecuencial = detpagocarga WHERE  guilnumero > 0 AND guissucursal = ? AND pagdtfecha = ? AND guisguiafactura = ? GROUP  BY guiadecarga.guilcodigo, clisnombre UNION SELECT guiadecarga.guilcodigo, guilnumero, '' AS guisorigen, '' AS guisdetino, guinflete, guinedomicilio, guinservicioa, guinseguro, guindescuento, guiniva, guintotal, '' AS pastipo, 0 AS pagnvalor, guisobservacion, guisusuario, 0 AS efectivo, 0 AS credito, 0 AS retencion, 0 AS cheque, 0 AS tdebito, 0 AS tcredito, '' AS clisnombre, guinpesovol, guinpeso, guisestado, guinotros, guidfecha, guinimpuio AS impUIO, guinimpgps AS impGPS, guinimpscy  AS impSCY, guintarifaneta AS tarifaneta, '' AS bancoTD, '' AS franquiciaTD, '' AS vencimientoTD, '' AS ultimosdigitosTD, '' AS numeroAutorizacionTD, '' AS bancoTC, '' AS franquiciaTC, '' AS vencimientoTC, '' AS ultimosdigitosTC, '' AS numeroAutorizacionTC, numero_cierre AS numeroCierre FROM   guiadecarga JOIN pagoscarga ON guiadecarga.guilcodigo = pagoscarga.guilcodigo FULL OUTER JOIN detalletarjetacobro ON paglsecuencial = detpagocarga WHERE  guilnumero > 0 AND guissucursal = ? AND guidfecha = ? AND guisestado = 'X' AND guisguiafactura = ?";
        }

        PreparedStatement Buscar = this.con.prepareStatement(SQL);

        RepventascWC repventac = null;
//System.out.println("alex6y>>>>"+SQL);
        this.Lista = new LinkedList();

        ResultSet rs = null;

        Calendar fin = Calendar.getInstance();
        fin.set(anio, mes - 1, dia);
        Date fecha = fin.getTime();
        try {
            if (sucursal.equals("-1")) {
                Buscar.setString(1, codigo);
            } else {
                Buscar.setString(1, sucursal);
            }
            Buscar.setTimestamp(2, toTimestamp(fecha));
            Buscar.setString(3, documento);
            if (sucursal.equals("-1")) {
                Buscar.setString(4, codigo);
            } else {
                Buscar.setString(4, sucursal);
            }
            Buscar.setTimestamp(5, toTimestamp(fecha));
            Buscar.setString(6, documento);

            rs = Buscar.executeQuery();

            while (rs.next()) {
                //System.out.println("alex7z>>>>");
                this.Lista.add(RepventascWC.load(rs));
                logger.debug(rs);
            }
            // this.Lista.add(RepventascWC.reorder());

        }catch(Exception ex){
        logger.error(ex.getMessage());
        } finally {
            if (rs != null) {
                rs.close();
            }
        }
    }
    
    /**
     * Metodo utilizado para las operaciones de cierre de ventas diario
     * Accion 1: Consulta el total del cierre
     * Accion 2: Actualiza el numero de cierre
     * Accion 3: Consulta el total(cantidad) de transaccion de TC y TD que ya posee nunmero de cierre
     * Accion 4: Consulta el numero de cierre y la observacion
     * @param accion
     * @param dia
     * @param mes
     * @param anio
     * @param numero_cierre
     * @param observaciones
     * @return
     * @throws SQLException 
     */
    public float cierrePOS(long accion, int dia, int mes , int anio,String numero_cierre, String observaciones,String estacion)
            throws SQLException {
        if (!isConnected()) {
            throw new SQLException("Sin Conexion");
        }
        float retorno = 0.0F;
        String SQLSelect = "";
        String SQLUpdate = "";
        Calendar fin = Calendar.getInstance();
        fin.set(anio, mes - 1, dia);
        Date fecha = fin.getTime();
        ResultSet rs = null;
        try {
        if (accion==1) {
            //SQLSelect = "SELECT sum(pagnvalor) FROM detalletarjetacobro JOIN pagoscarga ON paglsecuencial = detpagocarga where pagoscarga.pagdtfecha =?";
            SQLSelect = "SELECT sum(pagnvalor) FROM detalletarjetacobro JOIN pagoscarga ON paglsecuencial = detpagocarga JOIN guiadecarga ON pagoscarga.guilcodigo = guiadecarga.guilcodigo  where pagoscarga.pagdtfecha =? AND guisorigen =?";
            PreparedStatement Buscar = this.con.prepareStatement(SQLSelect);
            Buscar.setTimestamp(1, toTimestamp(fecha));
            Buscar.setString(2, estacion);
            rs = Buscar.executeQuery();
            while (rs.next()) {
                retorno = rs.getFloat(1);
            }
        }
        if(accion==2){
            SQLUpdate="UPDATE detalletarjetacobro SET numero_cierre = ? , observaciones_cierre = ? where id_detalletarjeta in (SELECT id_detalletarjeta FROM detalletarjetacobro JOIN pagoscarga ON paglsecuencial = detpagocarga JOIN guiadecarga ON pagoscarga.guilcodigo = guiadecarga.guilcodigo  where pagoscarga.pagdtfecha =? AND guisorigen =?)";
            PreparedStatement Actualizar = this.con.prepareStatement(SQLUpdate); 
            Actualizar.setString(1,numero_cierre);
            Actualizar.setString(2, observaciones);
            Actualizar.setTimestamp(3,toTimestamp(fecha));
            Actualizar.setString(4, estacion);
            Actualizar.executeUpdate();
            retorno =1;
        
        }
        if(accion==3){
            SQLSelect = "SELECT count(*) FROM detalletarjetacobro JOIN pagoscarga ON paglsecuencial = detpagocarga JOIN guiadecarga ON pagoscarga.guilcodigo = guiadecarga.guilcodigo where pagoscarga.pagdtfecha = ? AND numero_cierre != '' AND guisorigen =?";
            PreparedStatement Buscar = this.con.prepareStatement(SQLSelect);
            Buscar.setTimestamp(1, toTimestamp(fecha));
            Buscar.setString(2, estacion);
            rs = Buscar.executeQuery();
            while (rs.next()) {
                retorno = rs.getLong(1);
            }    
        }
        if(accion==4){
        SQLSelect = "SELECT detalletarjetacobro.numero_cierre, detalletarjetacobro.observaciones_cierre FROM detalletarjetacobro JOIN pagoscarga ON paglsecuencial = detpagocarga JOIN guiadecarga ON pagoscarga.guilcodigo = guiadecarga.guilcodigo where pagoscarga.pagdtfecha = ? AND guisorigen =?";
        PreparedStatement Buscar = this.con.prepareStatement(SQLSelect);
            Buscar.setTimestamp(1, toTimestamp(fecha));
            Buscar.setString(2, estacion);
            rs = Buscar.executeQuery();
            while (rs.next()) {
                this.setDetalleCobro(DetalleCobroTarjeta.load(rs));
            }     
    
         retorno =1;
        }
            //return retorno;
        }catch(Exception ex){
            System.out.println("ERROR :" +ex.getMessage());
        }finally {
            if (rs != null) {
                rs.close();
            }
        }
        return retorno;
    }
    
       
    public List getRepventasCarga() {
        //System.out.println("alex7w>>>>");
        return this.Lista;
    }

    public void ModificarClientesCarga(String nombre, String direccion, String ciudad, String telefono, String ruc, float credito, String vendedor, float saldo, String cuenta, String codigos, int codigo, int contribuyente, float descuento, float mindescuento, int diagratis, float gratishasta, int tipotarifa, String creditocontado, String clicorreo)
            throws SQLException {
        if (!isConnected()) {
            throw new SQLException("Sin Conexion");
        }
        //System.out.println("nncux90");
        String SQL = "update cLientEScarga  set clisnombre=?,clisdireccion=?, clisciudad=?,clistelefono=?, clisruc=?,cliccredito=?,clisvendedor=?,clicsaldo=?,cliscodcuenta=?, cliscodigo=?,cliicontribuyente =?,clicdescuento=?,clicmindescuento=?,  cliidiagratis=?,clingratishasta=?,tiplsecuencial=?,cliscontadocredito=? , clicorreo=? where clilcodigo=?";

        PreparedStatement Insertar = this.con.prepareStatement(SQL);
        try {
            Insertar.setString(1, nombre.toUpperCase());
            Insertar.setString(2, direccion);
            Insertar.setString(3, ciudad.toUpperCase());
            Insertar.setString(4, telefono);
            Insertar.setString(5, ruc);
            Insertar.setFloat(6, credito);
            Insertar.setString(7, vendedor);
            Insertar.setFloat(8, saldo);
            Insertar.setString(9, cuenta.toUpperCase());
            Insertar.setString(10, codigos.toUpperCase());
            Insertar.setInt(11, contribuyente);
            Insertar.setFloat(12, descuento);
            Insertar.setFloat(13, mindescuento);
            Insertar.setInt(14, diagratis);
            Insertar.setFloat(15, gratishasta);
            Insertar.setInt(16, tipotarifa);
            Insertar.setString(17, creditocontado);
            Insertar.setString(18, clicorreo);
            Insertar.setInt(19, codigo);
            Insertar.executeUpdate();
        } catch (SQLException e) {
            throw new SQLException("Error en la actualizacion de Clientes: " + e.getMessage());
        }
    }

    public void BuscarDescuentosc(int codigo)
            throws SQLException {
        if (!isConnected()) {
            throw new SQLException("Sin Conexion");
        }
        String SQL = "select DEslSEcueNCial,clilcodigo,desorigen,desdestino,desndescuento,desnmindescuento,desusuario   from descuentoscarga  where clilcodigo=? ";

        PreparedStatement Buscar = this.con.prepareStatement(SQL);
        Descuentosc descuentosc = null;
        this.listadescuento = new LinkedList();
        ResultSet rs = null;
        try {
            Buscar.setInt(1, codigo);
            rs = Buscar.executeQuery();

            while (rs.next()) {
                this.listadescuento.add(Descuentosc.load(rs));
            }

        } finally {
            if (rs != null) {
                rs.close();
            }
        }
    }

    public void BuscarDescuentoscxruta(int codigo, String origen, String destino)
            throws SQLException {
        if (!isConnected()) {
            throw new SQLException("Sin Conexion");
        }
        String SQL = "select deslSecuencial,CLiLCodigo,desorigen,desdestino,desndescuento,desnmindescuento,desusuario   from descuentoscarga  where clilcodigo=? and desorigen=? and desdestino=? ";

        PreparedStatement Buscar = this.con.prepareStatement(SQL);
        Descuentosc descuentosc = null;
        this.listadescuento = new LinkedList();
        ResultSet rs = null;
        try {
            Buscar.setInt(1, codigo);
            Buscar.setString(2, origen);
            Buscar.setString(3, destino);
            rs = Buscar.executeQuery();

            while (rs.next()) {
                this.listadescuento.add(Descuentosc.load(rs));
            }

        } finally {
            if (rs != null) {
                rs.close();
            }
        }
    }

    public void BuscarDescuentoscarga(long codigo)
            throws SQLException {
        if (!isConnected()) {
            throw new SQLException("Sin Conexion");
        }
        String SQL = "select dESlsecueNCial,guiadecarga.clilcodigo,desorigen,desdestino,desndescuento,desnmindescuento,desusuario   from descuentoscarga,guiadecarga  where descuentoscarga.clilcodigo=guiadecarga.clilcodigo and guilcodigo=? ";

        PreparedStatement Buscar = this.con.prepareStatement(SQL);
        Descuentosc descuentosc = null;
        this.listadescuento = new LinkedList();
        ResultSet rs = null;
        try {
            Buscar.setLong(1, codigo);
            rs = Buscar.executeQuery();

            while (rs.next()) {
                this.listadescuento.add(Descuentosc.load(rs));
            }

        } finally {
            if (rs != null) {
                rs.close();
            }
        }
    }

    public void BuscarDescuentoc(int codigo)
            throws SQLException {
        if (!isConnected()) {
            throw new SQLException("Sin Conexion");
        }
        String SQL = "selecT deslseCuenciAL,clilcodigo,desorigen,desdestino,desndescuento,desnmindescuento,desusuario   from descuentoscarga  where deslsecuencial=? ";

        PreparedStatement Buscar = this.con.prepareStatement(SQL);
        Descuentosc descuentosc = null;
        this.listadescuento = new LinkedList();
        ResultSet rs = null;
        try {
            Buscar.setInt(1, codigo);
            rs = Buscar.executeQuery();

            while (rs.next()) {
                this.listadescuento.add(Descuentosc.load(rs));
            }

        } finally {
            if (rs != null) {
                rs.close();
            }
        }
    }

    public List getDescuentosc() {
        return this.listadescuento;
    }

    public void GrabarDescuento(String origen, String destino, float descuento, float mindescuento, int codigo)
            throws SQLException {
        Usuarios usuario = getUsuarios();

        if (!isConnected()) {
            throw new SQLException("Sin Conexion");
        }
        String SQL = "insert into descuentoscarga(clilcodigo,desorigen,desdestino,desndescuento,desnmindescuento,desusuario)  values (?,?,?,?,?,?)";

        PreparedStatement Insertar = this.con.prepareStatement(SQL);
        try {
            Insertar.setInt(1, codigo);
            Insertar.setString(2, origen.trim());
            Insertar.setString(3, destino.trim());
            Insertar.setFloat(4, descuento);
            Insertar.setFloat(5, mindescuento);
            Insertar.setString(6, usuario.getNombre());

            Insertar.executeUpdate();
        } catch (SQLException e) {
            throw new SQLException("Error en la inserción de Comision: " + e.getMessage());
        }
    }

    public void ActualizaDescuentosc(String origen, String destino, long codigo, float descuento, float mindescuento)
            throws SQLException {
        Usuarios usuario = getUsuarios();

        if (!isConnected()) {
            throw new SQLException("Sin Conexion");
        }
        String SQL = "update descuentoscarga set desorigen=?,desdestino=?,desndescuento=?,desnmindescuento=?,desusuario=?  where deslsecuencial=?";

        PreparedStatement Insertar = this.con.prepareStatement(SQL);
        try {
            Insertar.setString(1, origen);
            Insertar.setString(2, destino);
            Insertar.setFloat(3, descuento);
            Insertar.setFloat(4, mindescuento);
            Insertar.setString(5, usuario.getNombre());
            Insertar.setLong(6, codigo);

            Insertar.executeUpdate();
        } catch (SQLException e) {
            throw new SQLException("Error en la Actualizacion de Descuentos: " + e.getMessage());
        }
    }

    public void InsertarGuiaAnulado(String observaciones, long numero, String tipo)
            throws SQLException {
        if (!isConnected()) {
            throw new SQLException("Sin Conexion");
        }
        //System.out.println("asd9993h89h3e8h-a");
        String SQL = "insert into guiadecarga  (guilnumero,guidfecha,guissucursal,guisobservacion,guisusuario,guisestado,guisguiafactura) values(?,current_date,?,?,?,'X',?)";
        String SQL_bitacora = "inserT into bitacoraborradas  Select * from guiadecarga where guilnumero=? and guisusuario=? and guisguiafactura=?";
        String SQL0 = "delete from detalletarjetacobro where detpagocarga in (select paglsecuencial from pagoscarga where guilcodigo =(select guilcodigo from guiadecarga where guilnumero=? and guisusuario=? and guisguiafactura=?))";
        String SQL1 = "delete from guiadecarga where guilnumero=? and guisusuario=? and guisguiafactura=?";
        PreparedStatement Insertar = this.con.prepareStatement(SQL);
        PreparedStatement Bitacora = this.con.prepareStatement(SQL_bitacora);
        PreparedStatement BorrarDetalle = this.con.prepareStatement(SQL0);
        PreparedStatement Borrar = this.con.prepareStatement(SQL1);
        //System.out.println("SQL:"+SQL);
        //System.out.println("SQL_bitacora:"+SQL_bitacora);
        //System.out.println("SQL1:"+SQL1);
        Usuarios usuario = getUsuarios();
        try {
            Bitacora.setLong(1, numero);
            Bitacora.setString(2, usuario.getNombre());
            Bitacora.setString(3, tipo);
            Bitacora.executeUpdate();
            //System.out.println("asdalsd999hd22211-87");

            BorrarDetalle.setLong(1, numero);
            BorrarDetalle.setString(2, usuario.getNombre());
            BorrarDetalle.setString(3, tipo);
            BorrarDetalle.executeUpdate();
            
            Borrar.setLong(1, numero);
            Borrar.setString(2, usuario.getNombre());
            Borrar.setString(3, tipo);
            Borrar.executeUpdate();

            Insertar.setLong(1, numero);
            Insertar.setString(2, usuario.getSucursal());
            Insertar.setString(3, observaciones);
            Insertar.setString(4, usuario.getNombre());
            Insertar.setString(5, tipo);
            Insertar.executeUpdate();
        } catch (SQLException e) {
            throw new SQLException("Error en la inserción de las reservas: " + e.getMessage());
        }
    }

    public long TraerNguia(String sucursal, String Tipo)
            throws SQLException {
        if (!isConnected()) {
            throw new SQLException("Sin Conexion");
        }
        long retorno = -1L;
        String SQL1 = "";
        String SQL = "";
        if (Tipo.equals("G")) {
            SQL1 = "select suclguia from sucursales where sucscodigo=? ";
            SQL = "update sucursales set suclguia=suclguia+1 where sucscodigo=? ";
        } else if (Tipo.equals("F")) {
            SQL1 = "select suclfactura from sucursales where sucscodigo=? ";
            SQL = "update sucursales set suclfactura=suclfactura+1 where sucscodigo=? ";
        } else if (Tipo.equals("M")) {
            SQL1 = "select suclmanIFIesto from sucursales where sucscodigo=? ";
            SQL = "update sucursales set suclmanifiesto=suclmanifiesto+1 where sucscodigo=? ";
        }

        PreparedStatement Buscar = this.con.prepareStatement(SQL1);
        PreparedStatement Actualizar = this.con.prepareStatement(SQL);

        ResultSet rs = null;
        try {
            Buscar.setString(1, sucursal.trim());
            rs = Buscar.executeQuery();

            Actualizar.setString(1, sucursal.trim());
            Actualizar.executeUpdate();

            while (rs.next()) {
                retorno = rs.getLong(1);
            }
            return retorno;
        } finally {
            if (rs != null) {
                rs.close();
            }
        }
        // return retorno;
    }

    public long TraerVuelo(String Origen, String Destino, String Numero, int dia, int mes, int anio)
            throws SQLException {
        if (!isConnected()) {
            throw new SQLException("Sin Conexion");
        }
        long retorno = -1L;
        String SQL = "Select prolsecuencial  from programacion where prodfecha=?  and prosorigen=? and prosdestino=? and prosnumero=? and prosestado not in('X') ";

        PreparedStatement Buscar = this.con.prepareStatement(SQL);
        Calendar fin = Calendar.getInstance();
        fin.set(anio, mes - 1, dia);

        Date fecha = fin.getTime();

        ResultSet rs = null;
        try {
            Buscar.setTimestamp(1, toTimestamp(fecha));
            Buscar.setString(2, Origen.trim());
            Buscar.setString(3, Destino.trim());
            Buscar.setString(4, Numero.trim());
            rs = Buscar.executeQuery();

            while (rs.next()) {
                retorno = rs.getLong(1);
            }
            return retorno;
        } finally {
            if (rs != null) {
                rs.close();
            }
        }
        //   return retorno;
    }

    public void BuscarBoletop(long codigo)
            throws SQLException {
        if (!isConnected()) {
            throw new SQLException("Sin Conexion");
        }

        String SQL = "select cupsorigen,cupsdestino,boldfecha,ressapellido,ressnombre, bollnumero,bolnboletoant,bolntarifa,bolnq,bolniva,bolntasa,bolsseguro, bolncomision,bolnsc,bolnadc,bolnefectivo,bolntarjeta,bolncheque,bolnotros, bolsobservaciones from reservaciones join boletos on reservaciones.reslsecuencial=boletos.reslsecuencial join cupones on boletos.bollsecuencial=cupones.bollsecuencial where   boletos.bollsecuencial=?";

        this.Listap = new LinkedList();
        Boletom boletom = null;

        PreparedStatement buscar = this.con.prepareStatement(SQL);

        ResultSet rs = null;
        try {
            buscar.setLong(1, codigo);
            rs = buscar.executeQuery();
            while (rs.next()) {
                this.Listap.add(Boletom.load(rs));
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
        }
    }

    public List getBoletop() {
        return this.Listap;
    }

    public void ActualizaBoletoPenalidad(float tarifa, float q, float iva, float seguro, float tasa, float comision, float sc, float nadc, float efectivo, float tarjeta, float cheque, float otros, long sec, String obs, int vias)
            throws SQLException {
        Usuarios usuario = getUsuarios();

        if (!isConnected()) {
            throw new SQLException("Sin Conexion");
        }
        float fact = 1.0F;
        String SQL = "update boletos set bolntarifa=?,bolnq=?,bolniva=?,bolsseguro=?,bolncomision=?,bolnsc=?,  bolnadc=?,bolnefectivo=?,bolntarjeta=?,bolncheque=?,bolnotros=?,bolsobservaciones=?,bolsusuario=?  where bollsecuencial=?";

        String SQL2 = "update cupones set cupntarifa=?,cupnq=?,cupniva=?,cupntasa=?,cupnseguro=? where bollsecuencial";

        PreparedStatement Insertar = this.con.prepareStatement(SQL);
        PreparedStatement Actualizar = this.con.prepareStatement(SQL2);
        try {
            Insertar.setFloat(1, tarifa);
            Insertar.setFloat(2, q);
            Insertar.setFloat(3, iva);
            Insertar.setFloat(4, seguro);

            Insertar.setFloat(5, comision);
            Insertar.setFloat(6, sc);
            Insertar.setFloat(7, nadc);
            Insertar.setFloat(8, efectivo);
            Insertar.setFloat(9, tarjeta);
            Insertar.setFloat(10, cheque);
            Insertar.setFloat(11, otros);
            Insertar.setString(12, obs);
            Insertar.setString(13, usuario.getNombre());
            Insertar.setLong(14, sec);
            Insertar.executeUpdate();
            Actualizar.setFloat(1, tarifa * fact);
            Actualizar.setFloat(2, q * fact);
            Actualizar.setFloat(3, iva * fact);
            Actualizar.setFloat(4, tasa * fact);
            Actualizar.setFloat(5, seguro * fact);
        } catch (SQLException e) {
            throw new SQLException("Error en la Actualizacion de Boletos: " + e.getMessage());
        }
    }

    public void InsertarPnlenviar(int dia, int mes, int anio, String origen, String numvuelo)
            throws SQLException {
        if (!isConnected()) {
            throw new SQLException("Sin Conexion");
        }
        Calendar inicio = Calendar.getInstance();
        inicio.set(anio, mes - 1, dia);
        Date mifecha = inicio.getTime();

        String SQL = "insert into enviopnl (endfecha,ensorigen,ensnumvuelo,enienviado) values(?,?,?,0)";
        PreparedStatement Insertar = this.con.prepareStatement(SQL);
        try {
            Insertar.setTimestamp(1, toTimestamp(mifecha));
            Insertar.setString(2, origen);
            Insertar.setString(3, numvuelo);
            Insertar.executeUpdate();
        } catch (SQLException e) {
            throw new SQLException("Error en la Crear Pnl: " + e.getMessage());
        }
    }

    public void BuscarTarifasCargaVuelo(String origen, String destino)
            throws SQLException {
        if (!isConnected()) {
            throw new SQLException("Sin Conexion");
        }
        String SQL = "select tarlsecuencial,tarsorigen,  tarsdestino,tariminimo,tarntarifa, tarnvalorizacion,tarnseguro,tarniva,taritipo from tarifascarga where tarsorigen=?  ";

        if (destino.length() > 0) {
            SQL = SQL + " and tarsdestino=? ";
        }
        SQL = SQL + " order by tarsorigen,tarsdestino   ";

        PreparedStatement Buscar = this.con.prepareStatement(SQL);
        Tarifasc tarifac = null;
        //System.out.println("alex7a>>>>");
        this.Lista = new LinkedList();
        ResultSet rs = null;
        try {
            Buscar.setString(1, origen);
            if (destino.length() > 0) {
                Buscar.setString(2, destino);
            }
            rs = Buscar.executeQuery();

            while (rs.next()) {
                //System.out.println("alex7b>>>>");
                this.Lista.add(Tarifasc.load(rs));
            }

        } finally {
            if (rs != null) {
                rs.close();
            }
        }
    }

    public void ActualizaSucursales(String codigo, String descripcion, String serie, long manifiesto, long numguia, long numfactura, String rguia, String rfactura)
            throws SQLException {
        if (!isConnected()) {
            throw new SQLException("Sin Conexion");
        }
        String SQL = "update sucursales set sucsdescripcion=?,sucsserie=?,suclmanifiesto=?,sucguia=?,sucfactura=?,sucrangoguia=?,sucrangofactura=? where sucscodigo=? ";

        PreparedStatement Insertar = this.con.prepareStatement(SQL);
        try {
            Insertar.setString(1, descripcion.toUpperCase());
            Insertar.setString(2, serie);
            Insertar.setLong(3, manifiesto);
            Insertar.setLong(4, numguia);
            Insertar.setLong(5, numfactura);
            Insertar.setString(6, rguia.toUpperCase());
            Insertar.setString(7, rfactura.toUpperCase());
            Insertar.setString(8, codigo.toUpperCase());

            Insertar.executeUpdate();
        } catch (SQLException e) {
            throw new SQLException("Error en la inserción de Sucursales: " + e.getMessage());
        }
    }

    public void GrabarSucursales(String codigo, String descripcion, String serie, long manifiesto, long numguia, long numfactura, String rguia, String rfactura)
            throws SQLException {
        if (!isConnected()) {
            throw new SQLException("Sin Conexion");
        }
        String SQL = "insert into sucursales (sucscodigo,sucsdescripcion,sucsserie,suclmanifiesto,sucguia,sucfactura,sucrangoguia,sucrangofactura) values (?,?,?,?,?,?,?,?)";
        PreparedStatement Insertar = this.con.prepareStatement(SQL);
        try {
            Insertar.setString(1, codigo.toUpperCase());
            Insertar.setString(2, descripcion.toUpperCase());
            Insertar.setString(3, serie);
            Insertar.setLong(4, manifiesto);
            Insertar.setLong(5, numguia);
            Insertar.setLong(6, numfactura);
            Insertar.setString(7, rguia);
            Insertar.setString(8, rfactura);

            Insertar.executeUpdate();
        } catch (SQLException e) {
            throw new SQLException("Error en la inserción de Sucursales: " + e.getMessage());
        }
    }

    public void GrabarUsuarios(String clave, String nombre, String sucursal, String grupo, int tipo, String nombrecompleto)
            throws SQLException {
        if (!isConnected()) {
            throw new SQLException("Sin Conexion");
        }
        String SQL = "insert into usuarios (usrsnombre,usrsclave,usrssucursal,usrsgrupo,usrstipo,usrsnomcompleto) values (?,?,?,?,?,?)";
        PreparedStatement Insertar = this.con.prepareStatement(SQL);
        try {
            Insertar.setString(1, nombre.toUpperCase());
            Insertar.setString(2, clave);
            Insertar.setString(3, sucursal);
            Insertar.setString(4, grupo);
            Insertar.setInt(5, tipo);
            Insertar.setString(6, nombrecompleto.toUpperCase());
            Insertar.executeUpdate();
        } catch (SQLException e) {
            throw new SQLException("Error en la inserción de Usuarios: " + e.getMessage());
        }
    }

    public void ActualizaUsuarios(String nombre, String clave, String grupo, String sucursal, int Tipo, String nombrecompleto)
            throws SQLException {
        if (!isConnected()) {
            throw new SQLException("Sin Conexion");
        }
        String SQL = "update usuarios set usrsclave=?,usrssucursal=?,usrsgrupo=?,usrstipo=?,usrsnomcompleto=? where usrsnombre=? ";

        PreparedStatement Insertar = this.con.prepareStatement(SQL);
        try {
            Insertar.setString(1, clave);
            Insertar.setString(2, sucursal);
            Insertar.setString(3, grupo);
            Insertar.setInt(4, Tipo);
            Insertar.setString(5, nombrecompleto);
//			Insertar.setLong(6, numguia);
//			Insertar.setLong(7, numfac);
            Insertar.setString(6, nombre);
            Insertar.executeUpdate();
        } catch (SQLException e) {
            throw new SQLException("Error en la inserción de Usuarios: " + e.getMessage());
        }
    }

    public List getVueloreserva() {
        return this.Lista1;
    }

    public void BuscarTipostarifas()
            throws SQLException {
        if (!isConnected()) {
            throw new SQLException("Sin Conexion");
        }
        String SQL = "select tiplsecuencial,tipsnombre,tipsobservacion from tipostarifa ";
        PreparedStatement Buscar = this.con.prepareStatement(SQL);

        Tipot tipot = null;

        this.lista = new LinkedList();
        ResultSet rs = null;
        try {
            rs = Buscar.executeQuery();

            while (rs.next()) {
                this.lista.add(Tipot.load(rs));
            }

        } finally {
            if (rs != null) {
                rs.close();
            }
        }
    }

    public List getTiposTarifas() {
        return this.lista;
    }

    public void GrabarTipost(String nombre, String observacion)
            throws SQLException {
        if (!isConnected()) {
            throw new SQLException("Sin Conexion");
        }
        String SQL = "insert into tipostarifa (tipsnombre,tipsobservacion) values (?,?)";
        PreparedStatement Insertar = this.con.prepareStatement(SQL);
        try {
            Insertar.setString(1, nombre.toUpperCase());
            Insertar.setString(2, observacion);
            Insertar.executeUpdate();
        } catch (SQLException e) {
            throw new SQLException("Error en la inserción de Tipos Tarifas: " + e.getMessage());
        }
    }

    public void BuscarTipoTarifa(int codigo)
            throws SQLException {
        if (!isConnected()) {
            throw new SQLException("Sin Conexion");
        }
        String SQL = "select tiplsecuencial,tipsnombre,tipsobservacion from tipostarifa where tiplsecuencial=?  ";
        PreparedStatement Buscar = this.con.prepareStatement(SQL);

        Tipot tipot = null;

        this.lista = new LinkedList();
        ResultSet rs = null;
        try {
            Buscar.setInt(1, codigo);
            rs = Buscar.executeQuery();

            while (rs.next()) {
                this.lista.add(Tipot.load(rs));
            }

        } finally {
            if (rs != null) {
                rs.close();
            }
        }
    }

    public List getTipoTarifa() {
        return this.lista;
    }

    public void ActualizarTiposTarifas(long codigo, String nombre, String observacion)
            throws SQLException {
        if (!isConnected()) {
            throw new SQLException("Sin Conexion");
        }
        String SQL = "update tipostarifa set tipsnombre=?,tipsobservacion=?  where tiplsecuencial=? ";
        PreparedStatement Actualizar = this.con.prepareStatement(SQL);
        try {
            Actualizar.setString(1, nombre.toUpperCase());
            Actualizar.setString(2, observacion);
            Actualizar.setLong(3, codigo);
            Actualizar.executeUpdate();
        } catch (SQLException e) {
            throw new SQLException("Error en la actualizacion de Tipos Tarifas: " + e.getMessage());
        }
    }

    public int BuscarTipotarifaCliente(int cliente)
            throws SQLException {
        if (!isConnected()) {
            throw new SQLException("Sin Conexion");
        }
        int retorno = -1;
        //System.out.println("iszxz10");
        String SQL = "select tiplsecuencial   from clientescarga where clilcodigo=? ";

        PreparedStatement Buscar = this.con.prepareStatement(SQL);

        ResultSet rs = null;
        try {
            Buscar.setInt(1, cliente);

            rs = Buscar.executeQuery();

            while (rs.next()) {
                retorno = rs.getInt(1);
            }
            return retorno;
        } finally {
            if (rs != null) {
                rs.close();
            }
        }
        //  return retorno;
    }

    public long InsertaFacturaC(int dia, int mes, int anio, int cliente, String observacion, long factura, float total, String milista)
            throws SQLException {
        if (!isConnected()) {
            throw new SQLException("Sin Conexion");
        }
        String SQL = "insert into facturacarga(faclnumfactura,facdfecha,facntotal,clilcodigo,facssucursal,facsobservaciones,usuario) values(?,?,?,?,?,?,?)";

        String SQL1 = " update guiadecarga set faclnumfactura=? where  guilcodigo in (" + milista + ")";
        PreparedStatement Insertar = this.con.prepareStatement(SQL);
        PreparedStatement Actualizar = this.con.prepareStatement(SQL1);
        Usuarios usuario = getUsuarios();
        long retorna = -1L;

        Calendar inicio = Calendar.getInstance();
        inicio.set(anio, mes - 1, dia);
        Date fecha = inicio.getTime();

        long nfactura = factura;
        try {
            Insertar.setLong(1, nfactura);
            Insertar.setTimestamp(2, toTimestamp(fecha));
            Insertar.setFloat(3, total);
            Insertar.setInt(4, cliente);
            Insertar.setString(5, usuario.getSucursal());
            Insertar.setString(6, observacion);
            Insertar.setString(7, usuario.getNombre());
            Insertar.executeUpdate();
            Actualizar.setLong(1, nfactura);
            Actualizar.executeUpdate();
        } catch (SQLException e) {
            throw new SQLException("Error en la inserción de Facturas : " + e.getMessage());
        }

        return retorna;
    }

    public void GuiasAFacturarL(String milista)
            throws SQLException {
        if (!isConnected()) {
            throw new SQLException("Sin Conexion");
        }

        String SQL1 = "selECt  guilCOdigO,guilnumero,guidfecha,  guiipiezas,guinpeso,guiscontiene,guisremitente,guisdestinatario, guisruc,guistelefono,guincredito,clilcodigo,guissucursal,guiientregaen, guibentregadosino,fechagrabaentrega, usuarioentrega,guisobservacion,guisusuario, guinflete,guinedomicilio,guintransportea,guinseguro,guinotros,guindescuento,guiniva,guintotal, guiadecarga.prolsecuencial,guinpesovol,guinservicioa,guiihora,guiiminutos,guisguiafactura, guisdireccion,guisorigen,guisdestino,tiplsecuencial,'' as nombre,guindescuentop,guisestado  ,guistransito,guisserie , guinimpuio, guinimpgps, guinimpscy from guiadecarga  where guilcodigo in (" + milista + ")";

        PreparedStatement Buscar = this.con.prepareStatement(SQL1);

        Guias guia = null;
        //System.out.println("alex6q>>>>");
        this.Lista = new LinkedList();
        ResultSet rs = null;
        try {
            rs = Buscar.executeQuery();

            while (rs.next()) {
                //System.out.println("alex6w>>>>");
                this.Lista.add(Guias.load(rs));
            }

        } finally {
            if (rs != null) {
                rs.close();
            }
        }
    }

    public void BuscarGuiaDespacho(String Remitente, String Destinatario, long codcliente, int entregadosino)
            throws SQLException {
        String SQL = "";
        String sucursal = getUsuarios().getSucursal().substring(0, 3);
        if (!isConnected()) {
            throw new SQLException("Sin Conexion");
        }
        if (codcliente != -1L) {
            SQL = "select  guilCODigo,guILnumero,guidfecha, guiipiezas,guinpeso,guiscontiene,guisremitente,guisdestinatario, guisruc,guistelefono,guincredito,guiadecarga.clilcodigo,guissucursal,guiientregaen, guibentregadosino,fechagrabaentrega, usuarioentrega,guisobservacion,guisusuario, guinflete,guinedomicilio,guintransportea,guinseguro,guinotros,guindescuento,guiniva,guintotal, guiadecarga.prolsecuencial,guinpesovol,guinservicioa,guiihora,guiiminutos,guisguiafactura, guisdireccion,guisorigen,guisdestino,guiadecarga.tiplsecuencial,clisnombre,guindescuentop,guisestado,guistransito,guisserie , guinimpuio, guinimpgps, guinimpscy  from guiadecarga,clientescarga where guiadecarga.clilcodigo=? and guiadecarga.clilcodigo=clientescarga.clilcodigo and guibentregadosino=? and  guisdestino=? order by guilnumero";
        } else if (Remitente.length() > 0) {
            if (Destinatario.length() > 0) {
                SQL = "selECt  guilcodigo,guIlnumero,guidfecha, guiipiezas,guinpeso,guiscontiene,guisremitente,guisdestinatario, guisruc,guistelefono,guincredito,guiadecarga.clilcodigo,guissucursal,guiientregaen, guibentregadosino,fechagrabaentrega, usuarioentrega,guisobservacion,guisusuario, guinflete,guinedomicilio,guintransportea,guinseguro,guinotros,guindescuento,guiniva,guintotal, guiadecarga.prolsecuencial,guinpesovol,guinservicioa,guiihora,guiiminutos,guisguiafactura, guisdireccion,guisorigen,guisdestino,guiadecarga.tiplsecuencial,clisnombre,guindescuentop,guisestado ,guistransito,guisserie , guinimpuio, guinimpgps, guinimpscy from guiadecarga,clientescarga where guisremitente like ?  and guisdestinatario like ?  and guiadecarga.clilcodigo=clientescarga.clilcodigo and guibentregadosino=? and guisdestino=?";
            } else {
                SQL = "seLECt  guilcodIGo,guilnumero,guidfecha, guiipiezas,guinpeso,guiscontiene,guisremitente,guisdestinatario, guisruc,guistelefono,guincredito,guiadecarga.clilcodigo,guissucursal,guiientregaen, guibentregadosino,fechagrabaentrega, usuarioentrega,guisobservacion,guisusuario, guinflete,guinedomicilio,guintransportea,guinseguro,guinotros,guindescuento,guiniva,guintotal, guiadecarga.prolsecuencial,guinpesovol,guinservicioa,guiihora,guiiminutos,guisguiafactura, guisdireccion,guisorigen,guisdestino,guiadecarga.tiplsecuencial,clisnombre,guindescuentop,guisestado  ,guistransito,guisserie , guinimpuio, guinimpgps, guinimpscy from guiadecarga,clientescarga where guisremitente like ?  and guiadecarga.clilcodigo=clientescarga.clilcodigo and guibentregadosino=? and guisdestino=?";
            }

        } else {
            SQL = "select  guiLCodigo,gUIlnumERO,guidfecha, guiipiezas,guinpeso,guiscontiene,guisremitente,guisdestinatario, guisruc,guistelefono,guincredito,guiadecarga.clilcodigo,guissucursal,guiientregaen, guibentregadosino,fechagrabaentrega, usuarioentrega,guisobservacion,guisusuario, guinflete,guinedomicilio,guintransportea,guinseguro,guinotros,guindescuento,guiniva,guintotal, guiadecarga.prolsecuencial,guinpesovol,guinservicioa,guiihora,guiiminutos,guisguiafactura, guisdireccion,guisorigen,guisdestino,guiadecarga.tiplsecuencial,clisnombre,guindescuentop,guisestado  ,guistransito,guisserie , guinimpuio, guinimpgps, guinimpscy from guiadecarga,clientescarga where guisdestinatario like ? and guiadecarga.clilcodigo=clientescarga.clilcodigo and guibentregadosino=? and guisdestino=?";
        }

        PreparedStatement BuscarGuiaDespacho = this.con.prepareStatement(SQL);
        Guias guiadespacho = null;
        this.Lista2 = new LinkedList();
        ResultSet rs = null;
        try {
            if (codcliente != -1L) {
                BuscarGuiaDespacho.setLong(1, codcliente);
                BuscarGuiaDespacho.setLong(2, entregadosino);
                BuscarGuiaDespacho.setString(3, sucursal);
            } else if (Remitente.length() > 0) {
                if (Destinatario.length() > 0) {
                    BuscarGuiaDespacho.setString(1, Remitente + "%");
                    BuscarGuiaDespacho.setString(2, Destinatario + "%");
                    BuscarGuiaDespacho.setLong(3, entregadosino);
                    BuscarGuiaDespacho.setString(4, sucursal);
                } else {
                    BuscarGuiaDespacho.setString(1, Remitente + "%");
                    BuscarGuiaDespacho.setLong(2, entregadosino);
                    BuscarGuiaDespacho.setString(3, sucursal);
                }
            } else {
                BuscarGuiaDespacho.setString(1, Destinatario + "%");
                BuscarGuiaDespacho.setLong(2, entregadosino);
                BuscarGuiaDespacho.setString(3, sucursal);
            }

            rs = BuscarGuiaDespacho.executeQuery();

            while (rs.next()) {
                this.Lista2.add(Guias.load(rs));
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
        }
    }

    public void BucarGuianoDespacho(int dia, int mes, int anio, int diah, int mesh, int anioh, String sucursal)
            throws SQLException {
        String SQL = "";

        if (!isConnected()) {
            throw new SQLException("Sin Conexion");
        }

        Calendar inicio = Calendar.getInstance();
        inicio.set(anio, mes - 1, dia);
        Date fecha = inicio.getTime();

        Calendar fin = Calendar.getInstance();
        inicio.set(anioh, mesh - 1, diah);
        Date fechah = fin.getTime();

        SQL = "selecT  guilcodigo,guilnumero,guIDfeCHa,  guiipiezas,guinpeso,guiscontiene,guisremitente,guisdestinatario, guisruc,guistelefono,guincredito,guiadecarga.clilcodigo,guissucursal,guiientregaen, guibentregadosino,fechagrabaentrega, usuarioentrega,guisobservacion,guisusuario, guinflete,guinedomicilio,guintransportea,guinseguro,guinotros,guindescuento,guiniva,guintotal, guiadecarga.prolsecuencial,guinpesovol,guinservicioa,guiihora,guiiminutos,guisguiafactura, guisdireccion,guisorigen,guisdestino,guiadecarga.tiplsecuencial,clisnombre,guindescuentop,guisestado,guistransito,guisserie, guinimpuio, guinimpgps, guinimpscy  from guiadecarga,clientescarga where guiadecarga.guissucursal=? and guibentregadosino=0 and guiadecarga.clilcodigo=clientescarga.clilcodigo and guidfecha>=? and  guidfecha<=? order by guilnumero";

        PreparedStatement BuscarGuiaDespacho = this.con.prepareStatement(SQL);
        Guias guiadespacho = null;
        this.Lista2 = new LinkedList();
        ResultSet rs = null;
        try {
            BuscarGuiaDespacho.setString(1, sucursal.trim());
            BuscarGuiaDespacho.setTimestamp(2, toTimestamp(fecha));
            BuscarGuiaDespacho.setTimestamp(3, toTimestamp(fechah));

            rs = BuscarGuiaDespacho.executeQuery();

            while (rs.next()) {
                this.Lista2.add(Guias.load(rs));
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
        }
    }

    public void BuscarGuiaDespacho(long guia)
            throws SQLException {
        if (!isConnected()) {
            throw new SQLException("Sin Conexion");
        }
        String SQL = "seleCT  Guilcodigo,guilnumero,guidfecha, guiipiezas,guinpeso,guiscontiene,guisremitente,guisdestinatario, guisruc,guistelefono,guincredito,guiadecarga.clilcodigo,guissucursal,guiientregaen, guibentregadosino,fechagrabaentrega, usuarioentrega,guisobservacion,guisusuario, guinflete,guinedomicilio,guintransportea,guinseguro,guinotros,guindescuento,guiniva,guintotal, guiadecarga.prolsecuencial,guinpesovol,guinservicioa,guiihora,guiiminutos,guisguiafactura, guisdireccion,guisorigen,guisdestino,guiadecarga.tiplsecuencial,clisnombre,guindescuentop,guisestado  ,guistransito,guisserie , guinimpuio, guinimpgps, guinimpscy from guiadecarga,clientescarga where guilnumero=?  and guiadecarga.clilcodigo=clientescarga.clilcodigo order by guisremitente,guisdestinatario";

        PreparedStatement BuscarGuiaDespacho = this.con.prepareStatement(SQL);
        Guias guiadespacho = null;
        this.Lista2 = new LinkedList();
        ResultSet rs = null;
        try {
            BuscarGuiaDespacho.setLong(1, guia);
            rs = BuscarGuiaDespacho.executeQuery();

            while (rs.next()) {
                this.Lista2.add(Guias.load(rs));
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
        }
    }

    public void BuscarGuiaDespachoM(long codigo)
            throws SQLException {
        if (!isConnected()) {
            throw new SQLException("Sin Conexion");
        }

        String SQL = " sELEct  guilcodigo,GUilnumERo,guIDfecha,   guiipiezas,guinpeso,guinpesovol,guiscontiene,   guisremitente,guisdestinatario,guisruc,guistelefono,    guisdireccion,guiadecarga.guisquienretira,guiadecarga.guisciquienretira,   guiadecarga.guisobservadespacho,guiadecarga.fechagrabaentrega,guisorigen,   guisdestino,clisnombre,guiadecarga.clilcodigo,guibentregadosino,guistelefonor   from guiadecarga,clientescarga   where guilcodigo=?   and guiadecarga.clilcodigo=clientescarga.clilcodigo   order by guisremitente,guisdestinatario";

        PreparedStatement BuscarGuiaDespacho = this.con.prepareStatement(SQL);
        Despachos guiadespacho = null;
        this.Lista2 = new LinkedList();
        ResultSet rs = null;
        try {
            BuscarGuiaDespacho.setLong(1, codigo);
            rs = BuscarGuiaDespacho.executeQuery();

            while (rs.next()) {
                this.Lista2.add(Despachos.load(rs));
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
        }
    }

    public List getGuiadespacho() {
        return this.Lista2;
    }

    public void BuscarAvion(int codigo)
            throws SQLException {
        if (!isConnected()) {
            throw new SQLException("Sin Conexion");
        }
        String SQL = "select avisdescripcion,avilsecuencial,aviicappax,avincapcarga from aviones where avilsecuencial=? ";
        PreparedStatement Buscar = this.con.prepareStatement(SQL);
        Aviones avion = null;
        this.aviones = new LinkedList();
        ResultSet rs = null;
        try {
            Buscar.setInt(1, codigo);
            rs = Buscar.executeQuery();

            while (rs.next()) {
                this.aviones.add(Aviones.load(rs));
            }

        } finally {
            if (rs != null) {
                rs.close();
            }
        }
    }

    public List getAviones() {
        return this.aviones;
    }

    public void BuscarAviones()
            throws SQLException {
        if (!isConnected()) {
            throw new SQLException("Sin Conexion");
        }
        String SQL = "select avisdescripcion,avilsecuencial,aviicappax,avincapcarga from aviones";
        PreparedStatement Buscar = this.con.prepareStatement(SQL);
        Aviones avion = null;
        this.aviones = new LinkedList();
        ResultSet rs = null;
        try {
            rs = Buscar.executeQuery();

            while (rs.next()) {
                this.aviones.add(Aviones.load(rs));
            }

        } finally {
            if (rs != null) {
                rs.close();
            }
        }
    }

    public void BuscarCiudad(String codigo)
            throws SQLException {
        if (!isConnected()) {
            throw new SQLException("Sin Conexion");
        }
        String SQL = "select ciuscodigo,ciusnombre,ciuiweb,ciumimpuesto,cuinseguro, ciuntasa,ciuiver,ciulcontinente  from ciudades  where ciuscodigo=? ";

        PreparedStatement Buscar = this.con.prepareStatement(SQL);
        Ciudades ciudad = null;

        this.lista = new LinkedList();
        ResultSet rs = null;
        try {
            Buscar.setString(1, codigo);
            rs = Buscar.executeQuery();

            while (rs.next()) {
                this.lista.add(Ciudades.load(rs));
            }

        } finally {
            if (rs != null) {
                rs.close();
            }
        }
    }

    public List getCiudades() {
        return this.lista;
    }

    public void BuscarCiudades()
            throws SQLException {
        if (!isConnected()) {
            throw new SQLException("Sin Conexion");
        }
        String SQL = "select ciuscodigo,ciusnombre,ciuiweb,ciumimpuesto,cuinseguro,ciuntasa,ciuiver,ciulcontinente from ciudades";

        PreparedStatement Buscar = this.con.prepareStatement(SQL);
        Ciudades ciudad = null;
        this.lista = new LinkedList();
        ResultSet rs = null;
        try {
            rs = Buscar.executeQuery();

            while (rs.next()) {
                this.lista.add(Ciudades.load(rs));
            }

        } finally {
            if (rs != null) {
                rs.close();
            }
        }
    }

    public void Guiaslista(String origen, String destino)
            throws SQLException {
        if (!isConnected()) {
            throw new SQLException("Sin Conexion");
        }
        String Origen = "";
        String SQL1 = "selecT    guilcOdigo,guilnUMero,guidfecha, guiipiezas,guinpeso,guiscontiene,guisremitente,guisdestinatario, guisruc,guistelefono,guincredito,guiadecarga.clilcodigo,guissucursal,guiientregaen, guibentregadosino,fechagrabaentrega, usuarioentrega,guisobservacion,guisusuario, guinflete,guinedomicilio,guintransportea,guinseguro,guinotros,guindescuento,guiniva,guintotal, guiadecarga.prolsecuencial,guinpesovol,guinservicioa,guiihora,guiiminutos,guisguiafactura, guisdireccion,guisorigen,guisdestino,guiadecarga.tiplsecuencial,clisnombre,guindescuentop,guisestado  ,guistransito,guisserie, guinimpuio, guinimpgps, guinimpscy from guiadecarga,clientescarga  where guiadecarga.clilcodigo=clientescarga.clilcodigo and guisestado<>'X' and ((guisorigen=?  and guisdestino=?)  or (guisorigen=? and guistransito=?) or (guistransito=? and guisdestino=?)) and (( manlsecuencial=0 and guistransito=guisdestino) or ( guilmanifiestotransito=0 and guistransito<>guisdestino)) order by   guilnumero, guisorigen,guisdestino";

        PreparedStatement Buscar = this.con.prepareStatement(SQL1);

        Guias guia = null;
        //System.out.println("alex6r>>>>");
        this.Lista = new LinkedList();
        ResultSet rs = null;
        try {
            Buscar.setString(1, origen);
            Buscar.setString(2, destino);
            Buscar.setString(3, origen);
            Buscar.setString(4, destino);
            Buscar.setString(5, origen);
            Buscar.setString(6, destino);

            rs = Buscar.executeQuery();

            while (rs.next()) {
                //System.out.println("alex6t>>>>");
                this.Lista.add(Guias.load(rs));
            }

        } finally {
            if (rs != null) {
                rs.close();
            }
        }
    }

    public void ListaGuias(String cadena)
            throws SQLException {
        if (!isConnected()) {
            throw new SQLException("Sin Conexion");
        }
        String Origen = "";
        String SQL1 = "selECt  GUilcodIGo,guilnumero,guidfecHA, guiipiezas,guinpeso,guiscontiene,guisremitente,guisdestinatario, guisruc,guistelefono,guincredito,guiadecarga.clilcodigo,guissucursal,guiientregaen, guibentregadosino,fechagrabaentrega, usuarioentrega,guisobservacion,guisusuario, guinflete,guinedomicilio,guintransportea,guinseguro,guinotros,guindescuento,guiniva,guintotal, guiadecarga.prolsecuencial,guinpesovol,guinservicioa,guiihora,guiiminutos,guisguiafactura, guisdireccion,guisorigen,guisdestino,guiadecarga.tiplsecuencial,clisnombre,guindescuentop,guisestado  ,guistransito,guisserie , guinimpuio, guinimpgps, guinimpscy from guiadecarga,clientescarga  where guiadecarga.clilcodigo=clientescarga.clilcodigo and guilcodigo in (" + cadena + ")" + " order by   guilnumero, guisorigen,guisdestino";

        PreparedStatement Buscar = this.con.prepareStatement(SQL1);

        Guias guia = null;
        //System.out.println("alex6y>>>>");
        this.Lista = new LinkedList();
        ResultSet rs = null;
        try {
            rs = Buscar.executeQuery();

            while (rs.next()) {
                //System.out.println("alex5z>>>>");
                this.Lista.add(Guias.load(rs));
            }

        } finally {
            if (rs != null) {
                rs.close();
            }
        }
    }

    public List getGuiasLista() {
        //System.out.println("alex5x>>>>");
        return this.Lista;
    }

    public void BuscarClienteCarga(int codigo)
            throws SQLException {
        this.Codcliente = codigo;
        if (!isConnected()) {
            throw new SQLException("Sin Conexion");
        }
        //System.out.println("nzixc70");
        String SQL = "select clilcodigo,clisnombre,clisdireccion,clisciudad, clistelefono,clisruc,cliccredito, clisvendedor,clicsaldo,cliscodcuenta,cliscodigo, cliicontribuyente,clicdescuento,clicmindescuento,   cliidiagratis,clingratishasta,tipsnombre,clientescarga.tiplsecuencial , cliscontadocredito ,clicorreo from  clientescarga,tipostarifa where clientescarga.tiplsecuencial=tipostarifa.tiplsecuencial  and clilcodigo=? ";

        PreparedStatement Buscar = this.con.prepareStatement(SQL);
        Clientesc clientec = null;

        this.Listaclic = new LinkedList();
        ResultSet rs = null;
        try {
            Buscar.setInt(1, codigo);
            rs = Buscar.executeQuery();

            while (rs.next()) {
                this.Listaclic.add(Clientesc.load(rs));
            }

        } finally {
            if (rs != null) {
                rs.close();
            }
        }
    }

    public void GrabarClientesCarga(String nombre, String direccion, String ciudad, String telefono, String ruc, float credito, String vendedor, float saldo, String cuenta, String codigos, int contribuyente, float descuento, float mindescuento, int diagratis, float gratishasta, int secuencialtipo, String creditocontado, String clicorreo)
            throws SQLException {
        if (!isConnected()) {
            throw new SQLException("Sin Conexion");
        }
        //System.out.println("nuiaso90");
        String SQL = "insert into clientescarga  (clisnombre,clisdireccion,clisciudad,clistelefono, clisruc,cliccredito,clisvendedor,clicsaldo,cliscodcuenta,cliscodigo,cliicontribuyente,clicdescuento,clicmindescuento,cliidiagratis,clingratishasta, tiplsecuencial,cliscontadocredito,clicorreo) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

        PreparedStatement Insertar = this.con.prepareStatement(SQL);
        try {
            Insertar.setString(1, nombre.toUpperCase());
            Insertar.setString(2, direccion);
            Insertar.setString(3, ciudad.toUpperCase());
            Insertar.setString(4, telefono);
            Insertar.setString(5, ruc);
            Insertar.setFloat(6, credito);
            Insertar.setString(7, vendedor);
            Insertar.setFloat(8, saldo);
            Insertar.setString(9, cuenta.toUpperCase());
            Insertar.setString(10, codigos.toUpperCase());
            Insertar.setInt(11, contribuyente);
            Insertar.setFloat(12, descuento);
            Insertar.setFloat(13, mindescuento);
            Insertar.setInt(14, diagratis);
            Insertar.setFloat(15, gratishasta);
            Insertar.setInt(16, secuencialtipo);
            Insertar.setString(17, creditocontado);
            Insertar.setString(18, clicorreo);
            Insertar.executeUpdate();
        } catch (SQLException e) {
            throw new SQLException("Error en la inserción de Clientes Carga: " + e.getMessage());
        }
    }

    public void GrabarDespacho(String quien, String ci, String observacion, long codigo, String telefonor)
            throws SQLException {
        if (!isConnected()) {
            throw new SQLException("Sin Conexion");
        }
        Calendar FECHPIE = Calendar.getInstance();
        Usuarios usuario = getUsuarios();

       // String SQL = "update guiadecarga  set  guisquienretira=?, guisciquienretira=?, guisobservadespacho=?, fechagrabaentrega=Now(), guibentregadosino=1, usuarioentrega=?,guistelefonor=? where guilcodigo=?";
        
		//ADDED ON OCT 2018
		//UNCOMMENT THE FOLLOWING LINE WHEN DEPLOYING IN AZURE AND COMMENT THE ABOVE ONE.
		//IT USES Now() FUNCTION OF POSTGRES
	String SQL = "update guiadecarga  set  guisquienretira=?, guisciquienretira=?, guisobservadespacho=?, fechagrabaentrega=SYSDATETIMEOFFSET(), guibentregadosino=1, usuarioentrega=?,guistelefonor=? where guilcodigo=?";
		//ADDED ON OCT 2018 - END

        PreparedStatement Insertar = this.con.prepareStatement(SQL);
        try {
            Insertar.setString(1, quien);
            Insertar.setString(2, ci);
            Insertar.setString(3, observacion);
            Insertar.setString(4, usuario.getNombre());

            Insertar.setString(5, telefonor);
            Insertar.setLong(6, codigo);

            Insertar.executeUpdate();
        } catch (SQLException e) {
            throw new SQLException("Error en la inserción del Despacho: " + e.getMessage());
        }
    }

    public void GrabarGuiasManifiesto(long codigo, long secmanifiesto)
            throws SQLException {
        if (!isConnected()) {
            throw new SQLException("Sin Conexion");
        }
        Calendar FECHPIE = Calendar.getInstance();
        Usuarios usuario = getUsuarios();

        String SQL1 = "update guiadecarga  set  guilmanifiestotransito=? where guilcodigo=? and manlsecuencial<>0";

        String SQL = "update guiadecarga  set  manlsecuencial=? where guilcodigo=? and manlsecuencial=0";

        PreparedStatement Insertar1 = this.con.prepareStatement(SQL1);
        try {
            Insertar1.setLong(1, secmanifiesto);
            Insertar1.setLong(2, codigo);

            Insertar1.executeUpdate();
        } catch (SQLException e) {
            throw new SQLException("Error en la inserción del Manifiesto: " + e.getMessage());
        }

        PreparedStatement Insertar = this.con.prepareStatement(SQL);
        try {
            Insertar.setLong(1, secmanifiesto);
            Insertar.setLong(2, codigo);

            Insertar.executeUpdate();
        } catch (SQLException e) {
            throw new SQLException("Error en la inserción del Despacho: " + e.getMessage());
        }
    }

    public void BuscarTarifaCarga(long codigo)
            throws SQLException {
        if (!isConnected()) {
            throw new SQLException("Sin Conexion");
        }
        String SQL = "select tarlsecuencial, tariminimo,tarntarifa, tarnvalorizacion,tarnseguro,tarniva,tipsnombre,tarniniciorango, tarnfinrango,taricontinente,tarifascarga.tiplsecuencial,tarivalorizfija,tarndescuento, fecha_creacion, fecha_modificacion from tarifascarga,tipostarifa  where tarifascarga.tiplsecuencial=tipostarifa.tiplsecuencial and tarlsecuencial=? ";

        PreparedStatement Buscar = this.con.prepareStatement(SQL);
        Tarifasc tarifac = null;
        //System.out.println("alex5v>>>>");
        this.Lista = new LinkedList();
        ResultSet rs = null;
        try {
            Buscar.setLong(1, codigo);
            rs = Buscar.executeQuery();

            while (rs.next()) {
                //System.out.println("alex5n>>>>");
                this.Lista.add(Tarifasc.load(rs));
            }

        } finally {
            if (rs != null) {
                rs.close();
            }
        }
    }

    public void ActualizaTarifasCarga(long codigo, float desde, float hasta, int minimo, float tarifa, float valorizacion, float seguro, float iva, int tipo, String DentroFuera, int vfija, float descuento, Date fechaMod)
            throws SQLException {
        if (!isConnected()) {
            throw new SQLException("Sin Conexion");
        }
        String SQL = "update tarifascarga set  tarniniciorango =?,tarnfinrango=?,tariminimo=? , tarntarifa=?,tarnvalorizacion=?,tarnseguro=?, tarniva=?,tiplsecuencial=?,taricontinente=?,tarivalorizfija=?,tarndescuento=?, fecha_modificacion=?  where tarlsecuencial=? ";

        PreparedStatement Insertar = this.con.prepareStatement(SQL);
        try {
            Insertar.setFloat(1, desde);
            Insertar.setFloat(2, hasta);
            Insertar.setInt(3, minimo);
            Insertar.setFloat(4, tarifa);
            Insertar.setFloat(5, valorizacion);
            Insertar.setFloat(6, seguro);
            Insertar.setFloat(7, iva);
            Insertar.setInt(8, tipo);
            Insertar.setString(9, DentroFuera);
            Insertar.setInt(10, vfija);
            Insertar.setFloat(11, descuento);
            Insertar.setDate(12, (java.sql.Date) fechaMod);
            Insertar.setLong(13, codigo);
            Insertar.executeUpdate();
        } catch (SQLException e) {
            throw new SQLException("Error en la Actualizacion de tarifas: " + e.getMessage());
        }
    }

    public void BuscarTarifasCarga()
            throws SQLException {
        if (!isConnected()) {
            throw new SQLException("Sin Conexion");
        }
        String SQL = "select tarlsecuencial, tariminimo,tarntarifa, tarnvalorizacion,tarnseguro,tarniva,tipsnombre,tarniniciorango, tarnfinrango,taricontinente,tarifascarga.tiplsecuencial,tarivalorizfija,tarndescuento, fecha_creacion , fecha_modificacion from tarifascarga,tipostarifa  where tarifascarga.tiplsecuencial=tipostarifa.tiplsecuencial order by  tipsnombre,tarniniciorango,tarnfinrango  ";

        PreparedStatement Buscar = this.con.prepareStatement(SQL);
        Tarifasc tarifac = null;
        //System.out.println("alex4h>>>>");
        this.Lista = new LinkedList();
        ResultSet rs = null;
        try {
            rs = Buscar.executeQuery();

            while (rs.next()) {
                //System.out.println("alex4j>>>>");
                this.Lista.add(Tarifasc.load(rs));
            }

        } finally {
            if (rs != null) {
                rs.close();
            }
        }
    }

    public List getTarifasCarga() {
        //System.out.println("alex4p>>>>");
        return this.Lista;
    }

    public void GrabarTarifasCarga(float desde, float hasta, int minimo, float tarifa, float valorizacion, float seguro, float iva, int tipo, String continente, float descuento, int vfija, Date fechaini)
            throws SQLException {
        if (!isConnected()) {
            throw new SQLException("Sin Conexion");
        }
        String SQL = "insert into tarifascarga  (tarniniciorango,tarnfinrango, tariminimo, tarntarifa,tarnvalorizacion,tarnseguro,tarniva,tiplsecuencial,taricontinente,tarndescuento,tarivalorizfija,fecha_creacion) values(?,?,?,?,?,?,?,?,?,?,?,?)";

        PreparedStatement Insertar = this.con.prepareStatement(SQL);
        try {
            Insertar.setFloat(1, desde);
            Insertar.setFloat(2, hasta);
            Insertar.setInt(3, minimo);
            Insertar.setFloat(4, tarifa);
            Insertar.setFloat(5, valorizacion);
            Insertar.setFloat(6, seguro);
            Insertar.setFloat(7, iva);
            Insertar.setInt(8, tipo);
            Insertar.setString(9, continente);
            Insertar.setFloat(10, descuento);
            Insertar.setInt(11, vfija);
            Insertar.setDate(12, (java.sql.Date) fechaini);
            Insertar.executeUpdate();
        } catch (SQLException e) {
            throw new SQLException("Error en la inserción de Tarifas Carga: " + e.getMessage());
        }
    }

    public long GrabarManifiesto(int dia, int mes, int anio, String vuelo, String equipo, float totalpeso, int totalpiezas, String observaciones, String Origen, String Destino, long nummanifiesto)
            throws SQLException {
        if (!isConnected()) {
            throw new SQLException("Sin Conexion");
        }
        Calendar fechax = Calendar.getInstance();
        fechax.set(anio, mes - 1, dia);
        Date fecha = fechax.getTime();
        Usuarios usuario = getUsuarios();
        String sucursal = this.usr.getSucursal();

        long manifiesto = nummanifiesto;

        //String SQL = "Insert into manifiestocarga (manlnummanifiesto,mandfecha,mansvuelo  ,mansequipo,manntotalpeso,manntotalpiezas,usuario,fechagraba, mansobservaciones,sucscodigo,mansorigen,mansdestino) values (?,?,?,?,?,?,?,now(),?,?,?,?)";
		
		//ADDED ON OCT 2018
		//UNCOMMENT THE FOLLOWING LINE WHEN DEPLOYING IN AZURE AND COMMENT THE ABOVE ONE.
		//IT USES Now() FUNCTION OF POSTGRES
	String SQL = "Insert into manifiestocarga (manlnummanifiesto,mandfecha,mansvuelo  ,mansequipo,manntotalpeso,manntotalpiezas,usuario,fechagraba, mansobservaciones,sucscodigo,mansorigen,mansdestino) values (?,?,?,?,?,?,?,SYSDATETIMEOFFSET(),?,?,?,?)";
		////ADDED ON OCT 2018 - END
		
        PreparedStatement Insertar = this.con.prepareStatement(SQL);
        try {
            Insertar.setLong(1, manifiesto);
            Insertar.setTimestamp(2, toTimestamp(fecha));
            Insertar.setString(3, vuelo);
            Insertar.setString(4, equipo);
            Insertar.setFloat(5, totalpeso);
            Insertar.setInt(6, totalpiezas);
            Insertar.setString(7, usuario.getNombre());
            Insertar.setString(8, observaciones);
            Insertar.setString(9, sucursal);
            Insertar.setString(10, Origen);
            Insertar.setString(11, Destino);

            Insertar.executeUpdate();
        } catch (SQLException e) {
            throw new SQLException("Error en la inserción del Despacho: " + e.getMessage());
        }

        String SQL1 = "Select manlsecuencial from manifiestocarga where mandfecha=?  and mansvuelo=?  and manlnummanifiesto=? and sucscodigo=? ";

        PreparedStatement Buscar = this.con.prepareStatement(SQL1);
        long retorno = 0L;
        ResultSet rs = null;
        try {
            Buscar.setTimestamp(1, toTimestamp(fecha));
            Buscar.setString(2, vuelo);
            Buscar.setLong(3, manifiesto);
            Buscar.setString(4, sucursal);

            rs = Buscar.executeQuery();

            while (rs.next()) {
                retorno = rs.getLong(1);
            }

        } catch (SQLException e) {
            throw new SQLException("Error en la BuSQUEDA: " + e.getMessage());
        }

        String SQL2 = "update  sucursales set suclmanifiesto=? where sucscodigo=?  and suclmanifiesto<=? ";

        PreparedStatement Actualizar = this.con.prepareStatement(SQL2);
        manifiesto += 1L;
        try {
            Actualizar.setLong(1, manifiesto);
            Actualizar.setString(2, sucursal);
            Actualizar.setLong(3, manifiesto);
            Actualizar.executeUpdate();
        } catch (SQLException e) {
            throw new SQLException("Error en la BuSQUEDA: " + e.getMessage());
        }

        return retorno;
    }

    public void GrabarAviones(String descripcion, int capacidadp, float capcarga)
            throws SQLException {
        if (!isConnected()) {
            throw new SQLException("Sin Conexion");
        }
        String SQL = "insert into aviones (avisdescripcion,aviicappax,avincapcarga) values (?,?,?)";
        PreparedStatement Insertar = this.con.prepareStatement(SQL);
        try {
            Insertar.setString(1, descripcion.toUpperCase());
            Insertar.setInt(2, capacidadp);
            Insertar.setFloat(3, capcarga);
            Insertar.executeUpdate();
        } catch (SQLException e) {
            throw new SQLException("Error en la inserción de Aviones: " + e.getMessage());
        }
    }

    public void ActualizaAviones(String descripcion, int capacidadp, float capcarga, int codigo)
            throws SQLException {
        if (!isConnected()) {
            throw new SQLException("Sin Conexion");
        }
        String SQL = "update aviones set avisdescripcion=?,aviicappax=?,avincapcarga=? where avilsecuencial=? ";
        PreparedStatement Insertar = this.con.prepareStatement(SQL);
        try {
            Insertar.setString(1, descripcion.toUpperCase());
            Insertar.setInt(2, capacidadp);
            Insertar.setFloat(3, capcarga);
            Insertar.setInt(4, codigo);
            Insertar.executeUpdate();
        } catch (SQLException e) {
            throw new SQLException("Error en la inserción de Aviones: " + e.getMessage());
        }
    }

    public void BuscarAsientos(int codigo)
            throws SQLException {
        if (!isConnected()) {
            throw new SQLException("Sin Conexion");
        }
        String SQL = "select avilsecuencial,asifila,asicolumna,asigrupo  from asientos where avilsecuencial=? order by  asifila,asicolumna ";

        PreparedStatement Buscar = this.con.prepareStatement(SQL);
        Asientos asiento = null;

        this.lista = new LinkedList();
        ResultSet rs = null;
        try {
            Buscar.setLong(1, codigo);
            rs = Buscar.executeQuery();

            while (rs.next()) {
                this.lista.add(Asientos.load(rs));
            }

        } finally {
            if (rs != null) {
                rs.close();
            }
        }
    }

    public List getAsientos() {
        return this.lista;
    }

    public void ActualizaCiudades(String codigo, String descripcion, float impuesto, float tasa, float seguro, int web)
            throws SQLException {
        if (!isConnected()) {
            throw new SQLException("Sin Conexion");
        }
        String SQL = "update ciudades set ciusnombre=?,ciuiweb=?,ciumimpuesto=?,cuinseguro=?,ciuntasa=? where ciuscodigo=? ";
        PreparedStatement Insertar = this.con.prepareStatement(SQL);
        try {
            Insertar.setString(1, descripcion.toUpperCase());
            Insertar.setInt(2, web);
            Insertar.setFloat(3, impuesto);
            Insertar.setFloat(4, tasa);
            Insertar.setFloat(5, seguro);
            Insertar.setString(6, codigo);
            Insertar.executeUpdate();
        } catch (SQLException e) {
            throw new SQLException("Error en la inserción de Ciudades: " + e.getMessage());
        }
    }

    public void GrabarCiudades(String codigo, String descripcion, float impuesto, float tasa, float seguro, int web)
            throws SQLException {
        if (!isConnected()) {
            throw new SQLException("Sin Conexion");
        }
        String SQL = "insert into ciudades (ciuscodigo,ciusnombre,ciumimpuesto,ciuntasa,cuinseguro,ciuiweb) values (?,?,?,?,?,?)";
        PreparedStatement Insertar = this.con.prepareStatement(SQL);
        try {
            Insertar.setString(1, codigo.toUpperCase());
            Insertar.setString(2, descripcion.toUpperCase());
            Insertar.setFloat(3, impuesto);
            Insertar.setFloat(4, tasa);
            Insertar.setFloat(5, seguro);
            Insertar.setInt(6, web);
            Insertar.executeUpdate();
        } catch (SQLException e) {
            throw new SQLException("Error en la inserción de la Ciudad: " + e.getMessage());
        }
    }

    public void BuscarGrupos()
            throws SQLException {
        if (!isConnected()) {
            throw new SQLException("Sin Conexion");
        }
        String SQL = "select gruscodigo,grusnombre from grupos";
        PreparedStatement Buscar = this.con.prepareStatement(SQL);
        Grupos grupo = null;
        this.lista = new LinkedList();
        ResultSet rs = null;
        try {
            rs = Buscar.executeQuery();

            while (rs.next()) {
                this.lista.add(Grupos.load(rs));
            }

        } finally {
            if (rs != null) {
                rs.close();
            }
        }
    }

    public List getGrupos() {
        return this.lista;
    }

    public void GrabarGrupos(String codigo, String nombre)
            throws SQLException {
        if (!isConnected()) {
            throw new SQLException("Sin Conexion");
        }
        String SQL = "insert into grupos (gruscodigo,grusnombre) values (?,?)";
        PreparedStatement Insertar = this.con.prepareStatement(SQL);
        try {
            Insertar.setString(1, codigo.toUpperCase());
            Insertar.setString(2, nombre);
            Insertar.executeUpdate();
        } catch (SQLException e) {
            throw new SQLException("Error en la inserción de Grupos: " + e.getMessage());
        }
    }

    public void ActualizaGrupos(String codigo, String nombre)
            throws SQLException {
        if (!isConnected()) {
            throw new SQLException("Sin Conexion");
        }
        String SQL = "update grupos set grusnombre=? where gruscodigo=? ";
        PreparedStatement Insertar = this.con.prepareStatement(SQL);
        try {
            Insertar.setString(1, nombre.toUpperCase());
            Insertar.setString(2, codigo);
            Insertar.executeUpdate();
        } catch (SQLException e) {
            throw new SQLException("Error en la inserción de Grupos: " + e.getMessage());
        }
    }

    public void BuscarGrupo(String codigo)
            throws SQLException {
        if (!isConnected()) {
            throw new SQLException("Sin Conexion");
        }
        String SQL = "select gruscodigo,grusnombre from grupos where gruscodigo=? ";
        PreparedStatement Buscar = this.con.prepareStatement(SQL);
        Grupos grupo = null;
        this.lista = new LinkedList();
        ResultSet rs = null;
        try {
            Buscar.setString(1, codigo);
            rs = Buscar.executeQuery();

            while (rs.next()) {
                this.lista.add(Grupos.load(rs));
            }

        } finally {
            if (rs != null) {
                rs.close();
            }
        }
    }

    public List getListaManifiestos() {
        return this.Listamanifiesto;
    }

    public void BuscarManifiesto(long codigo)
            throws SQLException {
        if (!isConnected()) {
            throw new SQLException("Sin Conexion");
        }
        String Origen = "";
        String SQL1 = "select manlsecuencial,  manlnummanifiesto,mandfecha,mansvuelo ,mansequipo,manntotalpeso,manntotalpiezas,usuario,mansobservaciones ,sucscodigo,mansorigen,mansdestino from manifiestocarga where manlsecuencial=? ";

        PreparedStatement Buscar = this.con.prepareStatement(SQL1);

        Manifiesto manifiesto = null;
        this.Listamanifiesto = new LinkedList();
        ResultSet rs = null;
        try {
            Buscar.setLong(1, codigo);
            rs = Buscar.executeQuery();

            while (rs.next()) {
                this.Listamanifiesto.add(Manifiesto.load(rs));
            }

        } finally {
            if (rs != null) {
                rs.close();
            }
        }
    }

    public void ListaGuiasManifiesto(long codigo)
            throws SQLException {
        if (!isConnected()) {
            throw new SQLException("Sin Conexion");
        }
        String Origen = "";
        String SQL1 = "select  guilcodIGO,guilnUmero,guIdfeCHa, guIIpiezas,guinpeso,guiscontiene,guisremitente,guisdestinatario, guisruc,guistelefono,guincredito,guiadecarga.clilcodigo,guissucursal,guiientregaen, guibentregadosino,fechagrabaentrega, usuarioentrega,guisobservacion,guisusuario, guinflete,guinedomicilio,guintransportea,guinseguro,guinotros,guindescuento,guiniva,guintotal, guiadecarga.prolsecuencial,guinpesovol,guinservicioa,guiihora,guiiminutos,guisguiafactura, guisdireccion,guisorigen,guisdestino,guiadecarga.tiplsecuencial,clisnombre,guindescuentop,guisestado  ,guistransito,guisserie , guinimpuio, guinimpgps, guinimpscy from guiadecarga,clientescarga  where guiadecarga.clilcodigo=clientescarga.clilcodigo and (manlsecuencial =? or guilmanifiestotransito=?) order by   guilnumero, guisorigen,guisdestino";

        PreparedStatement Buscar = this.con.prepareStatement(SQL1);

        Guias guia = null;
        this.ListaGuiasM = new LinkedList();
        ResultSet rs = null;
        try {
            Buscar.setLong(1, codigo);
            Buscar.setLong(2, codigo);
            rs = Buscar.executeQuery();
            while (rs.next()) {
                this.ListaGuiasM.add(Guias.load(rs));
            }

        } finally {
            if (rs != null) {
                rs.close();
            }
        }
    }

    public List getListaGuiasM() {
        return this.ListaGuiasM;
    }

    public void BuscarManifiestos(int diad, int mesd, int aniod, int diah, int mesh, int anioh, String origen, String destino)
            throws SQLException {
        if (!isConnected()) {
            throw new SQLException("Sin Conexion");
        }

        Calendar fechax = Calendar.getInstance();
        fechax.set(aniod, mesd - 1, diad);
        Date desde = fechax.getTime();

        Calendar fechay = Calendar.getInstance();
        fechay.set(anioh, mesh - 1, diah);
        Date hasta = fechay.getTime();

        String Origen = "";
        String SQL1 = "";
        if (destino.equals("*")) {
            if (origen.equals("*")) {
                SQL1 = "select manlsecuencial,  manlnummanifiesto,mandfecha,mansvuelo ,mansequipo,manntotalpeso,manntotalpiezas,usuario,mansobservaciones ,sucscodigo,mansorigen,mansdestino from manifiestocarga where mandfecha>=? and mandfecha<=?";
            } else {
                SQL1 = "select manlsecuencial,  manlnummanifiesto,mandfecha,mansvuelo ,mansequipo,manntotalpeso,manntotalpiezas,usuario,mansobservaciones ,sucscodigo,mansorigen,mansdestino from manifiestocarga where mandfecha>=? and mandfecha<=? and mansorigen=?";
            }

        } else if (origen.equals("*")) {
            SQL1 = "select manlsecuencial,  manlnummanifiesto,mandfecha,mansvuelo ,mansequipo,manntotalpeso,manntotalpiezas,usuario,mansobservaciones ,sucscodigo,mansorigen,mansdestino from manifiestocarga where mandfecha>=? and mandfecha<=? and mansdestino=?";
        } else {
            SQL1 = "select manlsecuencial,  manlnummanifiesto,mandfecha,mansvuelo ,mansequipo,manntotalpeso,manntotalpiezas,usuario,mansobservaciones ,sucscodigo,mansorigen,mansdestino from manifiestocarga where mandfecha>=? and mandfecha<=? and mansorigen=? and mansdestino=?";
        }

        PreparedStatement Buscar = this.con.prepareStatement(SQL1);

        Manifiesto manifiesto = null;
        this.Listamanifiesto = new LinkedList();
        ResultSet rs = null;
        try {
            if (destino.equals("*")) {
                if (origen.equals("*")) {
                    Buscar.setTimestamp(1, toTimestamp(desde));
                    Buscar.setTimestamp(2, toTimestamp(hasta));
                } else {
                    Buscar.setTimestamp(1, toTimestamp(desde));
                    Buscar.setTimestamp(2, toTimestamp(hasta));
                    Buscar.setString(3, origen);
                }

            } else if (origen.equals("*")) {
                Buscar.setTimestamp(1, toTimestamp(desde));
                Buscar.setTimestamp(2, toTimestamp(hasta));
                Buscar.setString(3, destino);
            } else {
                Buscar.setTimestamp(1, toTimestamp(desde));
                Buscar.setTimestamp(2, toTimestamp(hasta));
                Buscar.setString(3, origen);
                Buscar.setString(4, destino);
            }

            rs = Buscar.executeQuery();
            while (rs.next()) {
                this.Listamanifiesto.add(Manifiesto.load(rs));
            }

        } finally {
            if (rs != null) {
                rs.close();
            }
        }
    }

    public void Grabarbitacoratc(long sectarifa, String observaciones, String usuario, String tabla)
            throws SQLException {
        if (!isConnected()) {
            throw new SQLException("Sin Conexion");
        }
        String SQL = "insert into bitacoratarifasc  (tarlsecuencial, bitsobservaciones,usuario,tabla  ) values(?,?,?,?)";

        PreparedStatement Insertar = this.con.prepareStatement(SQL);
        try {
            Insertar.setLong(1, sectarifa);
            Insertar.setString(2, observaciones);
            Insertar.setString(3, usuario);
            Insertar.setString(4, tabla);
            Insertar.executeUpdate();
        } catch (SQLException e) {
            throw new SQLException("Error en la inserción de Tarifas Carga: " + e.getMessage());
        }
    }

    public long Traersecuencial(float desde, float hasta, int minimo, float tarifa, float valorizacion, float seguro, float iva, int tipo, String continente, float descuento)
            throws SQLException {
        if (!isConnected()) {
            throw new SQLException("Sin Conexion");
        }

        String SQL1 = "Select tarlsecuencial from tarifascarga  where tarniniciorango=?  and tarnfinrango=?  and tariminimo=? and tarntarifa=?  and tarnvalorizacion=? and tarnseguro=? and tarniva=? and tiplsecuencial=? and taricontinente=? and tarndescuento=?";

        PreparedStatement Buscar = this.con.prepareStatement(SQL1);
        long retorno = 0L;
        ResultSet rs = null;
        try {
            Buscar.setFloat(1, desde);
            Buscar.setFloat(2, hasta);
            Buscar.setInt(3, minimo);
            Buscar.setFloat(4, tarifa);
            Buscar.setFloat(5, valorizacion);
            Buscar.setFloat(6, seguro);
            Buscar.setFloat(7, iva);
            Buscar.setInt(8, tipo);
            Buscar.setString(9, continente);
            Buscar.setFloat(10, descuento);

            rs = Buscar.executeQuery();

            while (rs.next()) {
                retorno = rs.getLong(1);
            }

        } catch (SQLException e) {
            throw new SQLException("Error en la BuSQUEDA: " + e.getMessage());
        }

        return retorno;
    }

    public long Traerseccliente(String nombre, String direccion, String ciudad, String telefono, String ruc, float credito, int tipo, int diagratis)
            throws SQLException {
        if (!isConnected()) {
            throw new SQLException("Sin Conexion");
        }
        //System.out.println("ish900zxxxw");
        String SQL1 = "Select clilcodigo  from clientescarga  where clisnombre=?  and clisdireccion=?  and clisciudad=? and clistelefono=?  and clisruc=? and cliccredito=? and tiplsecuencial=? and cliidiagratis=?";

        PreparedStatement Buscar = this.con.prepareStatement(SQL1);
        long retorno = 0L;
        ResultSet rs = null;
        try {
            Buscar.setString(1, nombre.trim());
            Buscar.setString(2, direccion.trim());
            Buscar.setString(3, ciudad.trim());
            Buscar.setString(4, telefono.trim());
            Buscar.setString(5, ruc.trim());
            Buscar.setFloat(6, credito);
            Buscar.setInt(7, tipo);
            Buscar.setInt(8, diagratis);

            rs = Buscar.executeQuery();

            while (rs.next()) {
                retorno = rs.getLong(1);
            }

        } catch (SQLException e) {
            throw new SQLException("Error en la BuSQUEDA: " + e.getMessage());
        }

        return retorno;
    }

    public void Grabarbitacoraguia(long guiacodigo, String observaciones, String accion, String usuario)
            throws SQLException {
        if (!isConnected()) {
            throw new SQLException("Sin Conexion");
        }
        String SQL = "insert into bitacoraguias  (guilcodigo,bitsaccion, bitsobservaciones,usuario ) values(?,?,?,?)";

        PreparedStatement Insertar = this.con.prepareStatement(SQL);
        try {
            Insertar.setLong(1, guiacodigo);
            Insertar.setString(2, accion);
            Insertar.setString(3, observaciones);
            Insertar.setString(4, usuario);

            Insertar.executeUpdate();
        } catch (SQLException e) {
            throw new SQLException("Error en la inserción de BitacoraGuias: " + e.getMessage());
        }
    }

    public long consultarGuiaFacturaPorSucursal(String serie, String tipo)
            throws SQLException {
        if (!isConnected()) {
            throw new SQLException("Sin Conexion");
        }
        Long retorno = 0L, valor = null;
        String rango = "";
        String SQL = "";
        if (tipo.equals(TIPO_G)) {
            SQL = "SELECT sucguia,sucrangoguia FROM sucursales where sucsserie =?";
        } else if (tipo.equals(TIPO_F)) {
            SQL = "SELECT sucfactura,sucrangofactura FROM sucursales where sucsserie =?";

        }

        PreparedStatement Buscar = this.con.prepareStatement(SQL);

        ResultSet rs = null;
        try {
            Buscar.setString(1, serie.trim());
            rs = Buscar.executeQuery();

            while (rs.next()) {
                valor = rs.getLong(1);
                rango = rs.getString(2);
            }
            if (rango != null && valor != null) {
                String[] rangos = rango.split(SERARADOR_RANGO);
                valor++;
                if (rangos != null && valor <= new Long(rangos[1].trim()) && valor >= new Long(rangos[0].trim())) {
                    retorno = valor;
                } else {
                    retorno = 0L;
                }
            }
            return retorno;
        } finally {
            if (rs != null) {
                rs.close();
            }
        }
//    return retorno;
    }

    public long TraerNManifiesto(String sucursal, String Tipo)
            throws SQLException {
        if (!isConnected()) {
            throw new SQLException("Sin Conexion");
        }
        long retorno = -1L;
        String SQL1 = "";
        String SQL = "";
        if (Tipo.equals("G")) {
            SQL1 = "select usulguia from usuarios where usrsnombre=? ";
        } else if (Tipo.equals("F")) {
            SQL1 = "select usulfactura from usuarios where usrsnombre=? ";
        } else if (Tipo.equals("M")) {
            SQL1 = "select suclmanifiESTO from sucursales where sucscodigo=? ";
        }

        PreparedStatement Buscar = this.con.prepareStatement(SQL1);

        ResultSet rs = null;
        try {
            Buscar.setString(1, sucursal.trim());
            rs = Buscar.executeQuery();

            while (rs.next()) {
                retorno = rs.getLong(1);
            }
            return retorno;
        } finally {
            if (rs != null) {
                rs.close();
            }
        }
//    return retorno;
    }

    public void Borraguiaf(long numero, String tipo)
            throws SQLException {
        if (!isConnected()) {
            throw new SQLException("Sin Conexion");
        }
        String SQL2 = "insert into bitacoraborradas        Select * from guiadecarga  where guilnumero=? and guidfecha=current_date and guisusuario=? and guisguiafactura=?";

        String SQL = "delete from guiadecarga  where guilnumero=? and guidfecha=current_date and guisusuario=? and guisguiafactura=?";

        PreparedStatement Insertar = this.con.prepareStatement(SQL);
        PreparedStatement Insertarborradas = this.con.prepareStatement(SQL2);
        Usuarios usuario = getUsuarios();
        try {
            Insertarborradas.setLong(1, numero);
            Insertarborradas.setString(2, usuario.getNombre());
            Insertarborradas.setString(3, tipo);
            Insertarborradas.executeUpdate();

            Insertar.setLong(1, numero);
            Insertar.setString(2, usuario.getNombre());
            Insertar.setString(3, tipo);
            Insertar.executeUpdate();
        } catch (SQLException e) {
            throw new SQLException("Error en la inserción del Despacho: " + e.getMessage());
        }
    }

    public void BuscarClientesFacturar()
            throws SQLException {
        if (!isConnected()) {
            throw new SQLException("Sin Conexion");
        }
        //System.out.println("ish90zxzxwq0");
        String SQL = "select diSTinct clientescarga.clilcodigo,clisnombre,clisdireccion,clisciudad, clistelefono,clisruc,cliccredito, clisvendedor,clicsaldo,cliscodcuenta,cliscodigo, cliicontribuyente,clicdescuento,clicmindescuento,   cliidiagratis,clingratishasta,'' as tipsnombre,clientescarga.tiplsecuencial , cliscontadocredito ,clicorreo from  clientescarga join  guiadecarga  on clientescarga.clilcodigo=guiadecarga.clilcodigo  where faclnumfactura=0  and exists(SELECT 1 FROM pagoscarga  where guiadecarga.guilcodigo=pagoscarga.guilcodigo and pagstipo='CR')  order by clisnombre";

        PreparedStatement Buscar = this.con.prepareStatement(SQL);
        Clientesc clientec = null;

        this.Listaclic = new LinkedList();
        ResultSet rs = null;
        try {
            rs = Buscar.executeQuery();

            while (rs.next()) {
                this.Listaclic.add(Clientesc.load(rs));
            }

        } finally {
            if (rs != null) {
                rs.close();
            }
        }
    }

    public void BuscarDfrees(int codigo)
            throws SQLException {
        if (!isConnected()) {
            throw new SQLException("Sin Conexion");
        }
        String SQL = "select DIlcodigo,clilcodigo,diaidia,diankilos    from diasgratis  where clilcodigo=? ";

        PreparedStatement Buscar = this.con.prepareStatement(SQL);

        Free free = null;
        this.Lista1 = new LinkedList();
        ResultSet rs = null;
        try {
            Buscar.setInt(1, codigo);
            rs = Buscar.executeQuery();

            while (rs.next()) {
                this.Lista1.add(Free.load(rs));
            }

        } finally {
            if (rs != null) {
                rs.close();
            }
        }
    }

    public List getListaFree() {
        return this.Lista1;
    }

    public void GrabarFree(int dia, float kilos, long codigo)
            throws SQLException {
        Usuarios usuario = getUsuarios();

        if (!isConnected()) {
            throw new SQLException("Sin Conexion");
        }
        String SQL = "insert into diasgratis(clilcodigo,diaidia,diankilos)  values (?,?,?)";

        PreparedStatement Insertar = this.con.prepareStatement(SQL);
        try {
            Insertar.setLong(1, codigo);
            Insertar.setInt(2, dia);
            Insertar.setFloat(3, kilos);
            Insertar.executeUpdate();
        } catch (SQLException e) {
            throw new SQLException("Error en la inserción de Comision: " + e.getMessage());
        }
    }

    public String ExisteUsuario(String Usuario)
            throws SQLException {
        if (!isConnected()) {
            throw new SQLException("Sin Conexion");
        }

        String SQL1 = "Select usrsnombre from usuarios  where usrsnombre=?";

        PreparedStatement Buscar = this.con.prepareStatement(SQL1);
        String retorno = "0";
        ResultSet rs = null;
        try {
            Buscar.setString(1, Usuario.trim());

            rs = Buscar.executeQuery();

            while (rs.next()) {
                retorno = rs.getString(1);
            }

        } catch (SQLException e) {
            throw new SQLException("Error en la BuSQUEDA: " + e.getMessage());
        }

        return retorno;
    }

    public void BuscarFree(int codigo)
            throws SQLException {
        if (!isConnected()) {
            throw new SQLException("Sin Conexion");
        }
        String SQL = "select dilCODigo,clilcodigo,diaidia,diankilos   from diasgratis  where dilcodigo=? ";

        PreparedStatement Buscar = this.con.prepareStatement(SQL);
        Free free = null;
        this.Lista1 = new LinkedList();
        ResultSet rs = null;
        try {
            Buscar.setInt(1, codigo);
            rs = Buscar.executeQuery();

            while (rs.next()) {
                this.Lista1.add(Free.load(rs));
            }

        } finally {
            if (rs != null) {
                rs.close();
            }
        }
    }

    public void ActualizaFree(int dia, float kilos, long codigo)
            throws SQLException {
        if (!isConnected()) {
            throw new SQLException("Sin Conexion");
        }
        String SQL = "update diasgratis set diaidia=?,diankilos=? where dilcodigo=? ";
        PreparedStatement Insertar = this.con.prepareStatement(SQL);
        try {
            Insertar.setInt(1, dia);
            Insertar.setFloat(2, kilos);
            Insertar.setLong(3, codigo);
            Insertar.executeUpdate();
        } catch (SQLException e) {
            throw new SQLException("Error en la Actualizacion de Dias Free: " + e.getMessage());
        }
    }

    public void Borraguias(long secmanifiesto)
            throws SQLException {
        if (!isConnected()) {
            throw new SQLException("Sin Conexion");
        }
        //System.out.println("daoisdhaosdy88-1");
        String SQL = "update guiadecarga set manlsecuencial=0 where manlsecuencial=?";

        String SQL1 = "update guiadecarga set guilmanifiestotransito=0 where guilmanifiestotransito=?";

        PreparedStatement Insertar = this.con.prepareStatement(SQL);
        try {
            Insertar.setLong(1, secmanifiesto);

            Insertar.executeUpdate();
        } catch (SQLException e) {
            throw new SQLException("Error en la inserción del Despacho: " + e.getMessage());
        }

        PreparedStatement Insertar1 = this.con.prepareStatement(SQL1);
        try {
            Insertar1.setLong(1, secmanifiesto);

            Insertar1.executeUpdate();
        } catch (SQLException e) {
            throw new SQLException("Error en la inserción del Despacho: " + e.getMessage());
        }
    }

    public void ActualizaEstadoGuia(long codigo, String estado)
            throws SQLException {
        if (!isConnected()) {
            throw new SQLException("Sin Conexion");
        }
        String SQL = "update guiadecarga set guisestado=? where guilcodigo=? ";

        PreparedStatement Insertar = this.con.prepareStatement(SQL);
        try {
            Insertar.setString(1, estado.trim());
            Insertar.setLong(2, codigo);
            Insertar.executeUpdate();
        } catch (SQLException e) {
            throw new SQLException("Error en la Actualizacion de Estado Guia: " + e.getMessage());
        }
    }

    public float BuscarKilosgratis(int codigo, int dia)
            throws SQLException {
        float kilos = 0.0F;

        if (!isConnected()) {
            throw new SQLException("Sin Conexion");
        }
        String SQL = "select diankilos from diasgratis  where clilcodigo=?   and diaidia=? ";

        String SQL2 = "select sum( case  when (guinpesovol>guinpeso)   then  guinpesovol else guinpeso  end ) as peso  from guiadecarga  where clilcodigo=? and guidfecha=current_date ";

        PreparedStatement Buscar = this.con.prepareStatement(SQL);
        PreparedStatement Buscar1 = this.con.prepareStatement(SQL2);

        ResultSet rs = null;
        ResultSet rs1 = null;
        try {
            Buscar.setInt(1, codigo);
            Buscar.setInt(2, dia);
            //System.out.println("11111111111111111>>>>>>>>>" + Buscar);
            rs = Buscar.executeQuery();

            while (rs.next()) {
                kilos = rs.getFloat(1);
            }

            if (rs != null) {
                rs.close();
            }

        } catch (SQLException e) {
            throw new SQLException("Error en la Busqueda: " + e.getMessage());
        }

        try {
            Buscar1.setInt(1, codigo);
            //System.out.println("2222222222222222222222>>>>>>>>>" + Buscar1);
            rs1 = Buscar1.executeQuery();
            while (rs1.next()) {
                kilos -= rs1.getFloat(1);
            }
            if (rs1 != null) {
                rs1.close();
            }

        } catch (SQLException e) {
            throw new SQLException("Error en la Busqueda: " + e.getMessage());
        }
        //System.out.println("333333333333333333333||||||||||||||||>>>>>>>>>" + kilos);
        return kilos;
    }

    public void BuscarAuditoria(int diad, int mesd, int aniod, int diah, int mesh, int anioh)
            throws SQLException {
        if (!isConnected()) {
            throw new SQLException("Sin Conexion");
        }

        Calendar fechax = Calendar.getInstance();
        fechax.set(aniod, mesd - 1, diad);
        Date desde = fechax.getTime();

        Calendar fechay = Calendar.getInstance();
        fechay.set(anioh, mesh - 1, diah);
        Date hasta = fechay.getTime();

        String SQL1 = "";
        SQL1 = "Select fechagraba,bitsobservaciones,usuario,tarlsecuencial,tabla from bitacoratarifasc where cast( fechagraba as date) between ?  and ?";

        PreparedStatement Buscar = this.con.prepareStatement(SQL1);

        Auditoria auditoria = null;
        this.Listaauditoria = new LinkedList();
        ResultSet rs = null;
        try {
            Buscar.setTimestamp(1, toTimestamp(desde));
            Buscar.setTimestamp(2, toTimestamp(hasta));

            rs = Buscar.executeQuery();
            while (rs.next()) {
                this.Listaauditoria.add(Auditoria.load(rs));
            }

        } finally {
            if (rs != null) {
                rs.close();
            }
        }
    }

    public List getListaAuditoria() {
        return this.Listaauditoria;
    }

    public float TraeimpCiudad(String ciudad)
            throws SQLException {
        if (!isConnected()) {
            throw new SQLException("Sin Conexion");
        }

        String SQL1 = "Select ciumimpuesto  from ciudades  where ciuscodigo=?";

        PreparedStatement Buscar = this.con.prepareStatement(SQL1);
        float retorno = 0.0F;
        ResultSet rs = null;
        try {
            Buscar.setString(1, ciudad.trim());

            rs = Buscar.executeQuery();

            while (rs.next()) {
                retorno = rs.getFloat(1);
            }

        } catch (SQLException e) {
            throw new SQLException("Error en la Busqueda de Impuesto: " + e.getMessage());
        }

        return retorno;
    }

    public String ExisteCliente(String codcliente)
            throws SQLException {
        if (!isConnected()) {
            throw new SQLException("Sin Conexion");
        }
        //System.out.println("ish900bbbze");
        String SQL1 = "Select cliscodigo from clientescarga  where cliscodigo=?";

        PreparedStatement Buscar = this.con.prepareStatement(SQL1);
        String retorno = "0";
        ResultSet rs = null;
        try {
            Buscar.setString(1, codcliente.trim());

            rs = Buscar.executeQuery();

            while (rs.next()) {
                retorno = rs.getString(1);
            }

        } catch (SQLException e) {
            throw new SQLException("Error en la BuSQUEDA: " + e.getMessage());
        }

        return retorno;
    }

    public void Guiaslistau(int dia, int mes, int anio)
            throws SQLException {
        if (!isConnected()) {
            throw new SQLException("Sin Conexion");
        }

        String SQL1 = "selECt  guilCOdigo,guILNumero,guidfecha,  guiipiezas,guinpeso,guiscontiene,guisremitente,guisdestinatario, guisruc,guistelefono,guincredito,clilcodigo,guissucursal,guiientregaen, guibentregadosino,fechagrabaentrega, usuarioentrega,guisobservacion,guisusuario, guinflete,guinedomicilio,guintransportea,guinseguro,guinotros,guindescuento,guiniva,guintotal, guiadecarga.prolsecuencial,guinpesovol,guinservicioa,guiihora,guiiminutos,guisguiafactura, guisdireccion,guisorigen,guisdestino,tiplsecuencial,'' as nombre,guindescuentop,guisestado  ,guistransito,guisserie , guinimpuio, guinimpgps, guinimpscy from guiadecarga  where guidfecha=? and  guisestado<>'X' and guisusuario=? order by guilnumero,guisorigen,guisdestino";

        PreparedStatement Buscar = this.con.prepareStatement(SQL1);
        Usuarios usuario = getUsuarios();

        Guias guia = null;
        //System.out.println("alex2h>>>>");
        this.Lista = new LinkedList();
        ResultSet rs = null;

        Calendar fin = Calendar.getInstance();

        fin.set(anio, mes - 1, dia);

        Date fecha = fin.getTime();
        try {
            Buscar.setTimestamp(1, toTimestamp(fecha));
            Buscar.setString(2, usuario.getNombre());

            rs = Buscar.executeQuery();

            while (rs.next()) {
                this.Lista.add(Guias.load(rs));
            }

        } finally {
            if (rs != null) {
                rs.close();
            }
        }
    }

    public List BuscarPerfil(String usuario, String posicion)
            throws SQLException {
        if (!isConnected()) {
            throw new SQLException("Sin Conexion");
        }
        String SQL = " select menu.secmenu,secperfil,clave,nombre,posicion  from menu join perfil  on menu.secmenu=perfil.secmenu where usuario=? ";

        SQL = SQL + " and posicion like '" + posicion + "%' order by  posicion ";

        PreparedStatement Buscar = this.con.prepareStatement(SQL);
        Menus menu = null;

        this.Lista1 = new LinkedList();
        ResultSet rs = null;
        try {
            Buscar.setString(1, usuario);
            rs = Buscar.executeQuery();

            while (rs.next()) {
                this.Lista1.add(Menus.load(rs));
            }

        } finally {
            if (rs != null) {
                rs.close();
            }
        }

        return this.Lista1;
    }

    public List BuscarPerfil(String usuario)
            throws SQLException {
        if (!isConnected()) {
            throw new SQLException("Sin Conexion");
        }

        String SQL = " select menu.secmenu,secperfil,clave,nombre,posicion  from menu left join perfil  on perfil.secmenu=menu.secmenu  where usuario=?  union  select  secmenu,0 as secperfil,clave,nombre,posicion  from menu  where secmenu not in (  select secmenu from perfil where usuario=?)  order by  posicion ";

        PreparedStatement Buscar = this.con.prepareStatement(SQL);
        Menus menu = null;
        this.Lista1 = new LinkedList();
        ResultSet rs = null;
        try {
            Buscar.setString(1, usuario);
            Buscar.setString(2, usuario);
            rs = Buscar.executeQuery();

            while (rs.next()) {
                this.Lista1.add(Menus.load(rs));
            }

        } finally {
            if (rs != null) {
                rs.close();
            }
        }

        return this.Lista1;
    }

    public void BorraPerfil(String nombre)
            throws SQLException {
        if (!isConnected()) {
            throw new SQLException("Sin Conexion");
        }
        String SQL = "delete from perfil where usuario=? ";

        PreparedStatement Insertar = this.con.prepareStatement(SQL);
        try {
            Insertar.setString(1, nombre);
            Insertar.executeUpdate();
        } catch (SQLException e) {
            throw new SQLException("Error al Borrar Perfil: " + e.getMessage());
        }
    }

    public void ActualizaPerfil(String nombre, int clave)
            throws SQLException {
        if (!isConnected()) {
            throw new SQLException("Sin Conexion");
        }
        String SQL = "insert into perfil(usuario,secmenu) values(?,?) ";

        PreparedStatement Insertar = this.con.prepareStatement(SQL);
        try {
            Insertar.setString(1, nombre);
            Insertar.setInt(2, clave);

            Insertar.executeUpdate();
        } catch (SQLException e) {
            throw new SQLException("Error en la Actualizacion de Descuentos: " + e.getMessage());
        }
    }

    public void BuscarRepventasF(String sucursal, String codigo, int dia, int mes, int anio, String documento, int diah, int mesh, int anioh)
            throws SQLException {
        if (!isConnected()) {
            throw new SQLException("Sin Conexion");
        }
        String SQL;
//    String SQL;
        //System.out.println("ish900nihnzu11a");
        if (sucursal.equals("-1")) {
            SQL = " select  GUIadecarga.GUIlcodigo,mAx(guilnumero),max(guisorigen),max(guisdestino), max(guinflete),max(guinedomicilio),max(guinservicioa),max(guinseguro),max(guindescuento), max(guiniva),max(guintotal),max(pagstipo),sum(pagnvalor), max(guisobservacion),max(guisusuario),  sum(case when pagstipo='EF' THEN pagnvalor else 0 end), sum(case when pagstipo='CR' THEN pagnvalor else 0 end), sum(case when pagstipo='RT' THEN pagnvalor else 0 end),clisnombre,max(guinpesovol),max(guinpeso),max(guisestado),max(guinotros),max(pagdtfecha),max(guinimpuio), max(guinimpgps), max(guinimpSCY) , max(guintarifaneta) from  guiadecarga join clientescarga on guiadecarga.clilcodigo=clientescarga.clilcodigo  join pagoscarga on guiadecarga.guilcodigo= pagoscarga.guilcodigo  where  guilnumero>0  and guisusuario=? and  pagdtfecha between ? and ? and guisguiafactura=? group by guiadecarga.guilcodigo,clisnombre union select guilcodigo,guilnumero,'' as guisorigen,'' as guisdestino, guinflete,guinedomicilio,guinservicioa,guinseguro,guindescuento, guiniva,guintotal,'' as pastipo,0 as pagnvalor, guisobservacion,guisusuario, 0 as efectivo,0 as credito,0 as retencion,'' as clisnombre,guinpesovol,guinpeso,guisestado,guinotros,guidfecha,guinimpuio as impUIO, guinimpgps as impGPS, guinimpSCY as impSCY , guintarifaneta as tarifaneta  from guiadecarga  where  guilnumero>0  and guisusuario=? and  guidfecha between ? and ?  and guisestado='X' and guisguiafactura=? order by 2";
        } else {
            SQL = " selEct  guiAdecargA.guilcodigo,max(guilnumero),max(guisorigen),max(guisdestino), max(guinflete),max(guinedomicilio),max(guinservicioa),max(guinseguro),max(guindescuento), max(guiniva),max(guintotal),max(pagstipo),sum(pagnvalor), max(guisobservacion),max(guisusuario),  sum(case when pagstipo='EF' THEN pagnvalor else 0 end), sum(case when pagstipo='CR' THEN pagnvalor else 0 end),  sum(case when pagstipo='RT' THEN pagnvalor else 0 end),clisnombre,max(guinpesovol),max(guinpeso),max(guisestado),max(guinotros),max(pagdtfecha),max(guinimpuio), max(guinimpgps), max(guinimpSCY) , max(guintarifaneta) from  guiadecarga join clientescarga on guiadecarga.clilcodigo=clientescarga.clilcodigo  join pagoscarga on guiadecarga.guilcodigo= pagoscarga.guilcodigo  where  guilnumero>0  and guissucursal=? and  pagdtfecha between ? and ?  and guisguiafactura=? group by guiadecarga.guilcodigo,clisnombre union select guilcodigo,guilnumero,'' as guisorigen,'' as guisdestino, guinflete,guinedomicilio,guinservicioa,guinseguro,guindescuento, guiniva,guintotal,'' as pastipo,0 as pagnvalor, guisobservacion, guisusuario, 0 as efectivo,0 as credito,0 as retencion,'' as clisnombre,guinpesovol,guinpeso,guisestado,guinotros,guidfecha,guinimpuio as impUIO, guinimpgps as impGPS, guinimpSCY as impSCY , guintarifaneta as tarifaneta from guiadecarga  where  guilnumero>0  and guissucursal=? and guidfecha between ? and ?  and guisestado='X' and guisguiafactura=? order by 2";
        }

        PreparedStatement Buscar = this.con.prepareStatement(SQL);

        Repventasc repventac = null;

        //System.out.println("alex2u>>>>"+SQL);
        this.Lista = new LinkedList();
        ResultSet rs = null;

        Calendar fin = Calendar.getInstance();
        fin.set(anio, mes - 1, dia);
        Date fecha = fin.getTime();

        Calendar finh = Calendar.getInstance();
        finh.set(anioh, mesh - 1, diah);
        Date fechah = finh.getTime();
        try {
            if (sucursal.equals("-1")) {
                Buscar.setString(1, codigo);
            } else {
                Buscar.setString(1, sucursal);
            }
            Buscar.setTimestamp(2, toTimestamp(fecha));
            Buscar.setTimestamp(3, toTimestamp(fechah));
            Buscar.setString(4, documento);
            if (sucursal.equals("-1")) {
                Buscar.setString(5, codigo);
            } else {
                Buscar.setString(5, sucursal);
            }
            Buscar.setTimestamp(6, toTimestamp(fecha));
            Buscar.setTimestamp(7, toTimestamp(fechah));
            Buscar.setString(8, documento);

            rs = Buscar.executeQuery();

            while (rs.next()) {
                //System.out.println("alex2n>>>>");    
                this.Lista.add(Repventasc.load(rs));
            }

        } finally {
            if (rs != null) {
                rs.close();
            }
        }
    }

    public void BuscarPeso()
            throws SQLException {
        if (!isConnected()) {
            throw new SQLException("Sin Conexion");
        }
        String SQL = "select ballpeso,baldfecha,sucursal   from balanza  where sucursal=? ";

        String sucursalx = getUsuarios().getSucursal().substring(0, 3);
        PreparedStatement Buscar = this.con.prepareStatement(SQL);
        Balanza balanza = null;

        this.Lista1 = new LinkedList();
        ResultSet rs = null;
        try {
            Buscar.setString(1, sucursalx);
            rs = Buscar.executeQuery();

            while (rs.next()) {
                this.Lista1.add(Balanza.load(rs));
            }

        } finally {
            if (rs != null) {
                rs.close();
            }
        }
    }

    public List getListaPesp() {
        return this.Lista1;
    }

    // Agregados para modulo de anulación de guías
    /**
     * Metodo para generar un reporte de guias por serie y rango de fechas.
     *
     * @param serie Codigo de serie o sucursal (e.g. 018-002)
     * @param fechaInicio Inicio del intervalo de fechas para el reporte
     * @param fechaFin Fin del intervalo de fechas para el reporte
     * @param tipoDoc Tipo de documento (G - Guia, F- Factura)
     * @return El metodo no retorna un valor (retorna void), sin embargo, deja
     * la lista de resultados disponible en el model para poder obtenerla a
     * traves de model.getGuiasLista().
     * @throws SQLException
     */
    public void BuscarGuiaxSerie(String serie, long fechaInicio, long fechaFin, String tipoDoc)
            throws SQLException {
        if (!isConnected()) {
            throw new SQLException("Sin Conexion");
        }
        //System.out.println("ish90ZXZX0");
        String SQL = "select guiadecarga.guilcodigo,max(guilnumero),max(guisorigen),max(guisdestino), max(guinflete),max(guinedomicilio),max(guinservicioa),max(guinseguro),max(guindescuento),max(guiniva),max(guintotal),max(pagstipo),sum(pagnvalor), max(guisobservacion),max(guisusuario),sum(case when pagstipo='EF' THEN pagnvalor else 0 end),sum(case when pagstipo='CR' THEN pagnvalor else 0 end),sum(case when pagstipo='RT' THEN pagnvalor else 0 end),clisnombre,max(guinpesovol),max(guinpeso),max(guisestado),max(guinotros),max(pagdtfecha),max(guinimpuio), max(guinimpgps), max(guinimpSCY) , max(guintarifaneta) from guiadecarga join clientescarga on guiadecarga.clilcodigo=clientescarga.clilcodigo join pagoscarga on guiadecarga.guilcodigo= pagoscarga.guilcodigo where guisserie=? and pagdtfecha between ? and ? and guisguiafactura=? group by guiadecarga.guilcodigo,clisnombre order by 2";
        //System.out.println("---->"+SQL+";"+serie+";"+fechaInicio+","+new Timestamp(fechaInicio)+";"+new Timestamp(fechaFin)+fechaFin+","+";"+tipoDoc);
        PreparedStatement Buscar = this.con.prepareStatement(SQL);

        //StringTokenizer st2 = new StringTokenizer(serie, ",");
        this.Lista = new LinkedList();
        ResultSet rs = null;
        try {
            /*while (st2.hasMoreElements()) {
             System.out.println(st2.nextElement());
             }   */
            Buscar.setString(1, serie);
            Buscar.setTimestamp(2, new Timestamp(fechaInicio));
            Buscar.setTimestamp(3, new Timestamp(fechaFin));
            Buscar.setString(4, tipoDoc);

            rs = Buscar.executeQuery();

            while (rs.next()) {
                //System.out.println(">>>>2ukh0iiih");
                this.Lista.add(Repventasc.load(rs));
            }

        } finally {
            if (rs != null) {
                rs.close();
            }
        }
    }

    /**
     * Metodo para buscar las guias seleccionadas para anulación por codigo (PK
     * en guiadecarga)
     *
     * @param codGuias Arreglo de los codigos de guias
     * @return El metodo retorna void, sin embargo, deja la lista de resultados
     * disponible para obtenerla a traves de model.getGuiasLista().
     * @throws SQLException
     */
    public void BuscarGuiaxCodigo(String[] codGuias)
            throws SQLException {
        if (!isConnected()) {
            throw new SQLException("Sin Conexion");
        }
        StringBuilder valores = new StringBuilder("");

        for (String cod : codGuias) {
            valores.append(Long.parseLong(cod)).append(",");
        }
        //System.out.println("ish900nn7z/*");
        String SQL = "select guiadecarga.guilcodigo,max(guilnumero),max(guisorigen),max(guisdestino), max(guinflete),max(guinedomicilio),max(guinservicioa),max(guinseguro),max(guindescuento),max(guiniva),max(guintotal),max(pagstipo),sum(pagnvalor), max(guisobservacion),max(guisusuario),sum(case when pagstipo='EF' THEN pagnvalor else 0 end),sum(case when pagstipo='CR' THEN pagnvalor else 0 end),sum(case when pagstipo='RT' THEN pagnvalor else 0 end),clisnombre,max(guinpesovol),max(guinpeso),max(guisestado),max(guinotros),max(pagdtfecha),max(guinimpuio), max(guinimpgps), max(guinimpSCY) , max(guintarifaneta) from guiadecarga join clientescarga on guiadecarga.clilcodigo=clientescarga.clilcodigo join pagoscarga on guiadecarga.guilcodigo= pagoscarga.guilcodigo where guiadecarga.guilcodigo IN (" + valores.substring(0, valores.lastIndexOf(",")) + ") group by guiadecarga.guilcodigo,clisnombre order by 2";
        //System.out.println("------------->"+SQL);
        PreparedStatement Buscar = this.con.prepareStatement(SQL);

        this.Lista = new LinkedList();
        ResultSet rs = null;
        try {
            //System.out.println("hhuh1111111111");
            rs = Buscar.executeQuery();
            //System.out.println("hhuh1222222222");
            while (rs.next()) {
                //System.out.println("hhuh3333333333");
                this.Lista.add(Repventasc.load(rs));
                //System.out.println("hhuh4444444444");
            }
            //System.out.println("hhuh555555555555");
        } finally {
            if (rs != null) {
                //System.out.println("hhuh666666666");
                rs.close();
            }
        }
    }

    /**
     * Metodo que anula la lista de guías seleccionadas opr código. Se hace
     * UPDATE a campos en la tabla de guias, y se hace DELETE a registros en la
     * tabla de pagos, de manera que la guia no se refleje en los reportes de
     * ventas (se muestren valores a 0)
     *
     * @param codGuias Array con los codigos de guías a anular
     */
    public void AnularGuias(String[] codGuias) throws SQLException {
        if (!isConnected()) {
            throw new SQLException("Sin Conexion");
        }
        boolean autoCommitStatus = this.con.getAutoCommit();
        //System.out.println("aslkfnalsfu888/*");
        String bitacoraGuiaDeCarga = "inserT into bitacoraborradas  Select * from guiadecarga where guilcodigo=?";
        String updateGuiaCarga = "update guiadecarga set guinpeso=0, guincredito=0, guinflete=0, guinedomicilio=0, guintransportea=0, guinseguro=0, guinotros=0, guindescuento=0, guiniva=0, guintotal=0, guinpesovol=0, guinservicioa=0, guindescuentop=0, guinimpuio=0, guinimpgps=0, guinimpscy=0, guisestado='X', guisserie=8, guisobservacion='Anulado' where guilcodigo=?";
        String deleteDet ="delete from detalletarjetacobro where detpagocarga in(select paglsecuencial from detalletarjetacobro join pagoscarga on detpagocarga = paglsecuencial where guilcodigo=?)";
        String deletePagosCarga = "delete from pagoscarga where guilcodigo=?";
        
        //System.out.println("asdjlaksd898a1*-");
        this.con.setAutoCommit(false);

        PreparedStatement bitacora = this.con.prepareStatement(bitacoraGuiaDeCarga);

        PreparedStatement update = this.con.prepareStatement(updateGuiaCarga);

        PreparedStatement deleteDetalleTarjeta = this.con.prepareStatement(deleteDet);
        
        PreparedStatement delete = this.con.prepareStatement(deletePagosCarga);
        //System.out.println("asw222e2e*-");
        try {
            for (String cod : codGuias) {
                bitacora.setLong(1, Long.parseLong(cod));
                //System.out.println("-?>"+bitacoraGuiaDeCarga+":::::"+cod);
                bitacora.addBatch();
                update.setLong(1, Long.parseLong(cod));
                update.addBatch();
                deleteDetalleTarjeta.setLong(1, Long.parseLong(cod));
                deleteDetalleTarjeta.addBatch();
                        
                delete.setLong(1, Long.parseLong(cod));
                delete.addBatch();
            }
            //System.out.println("asasas119u09u9u*1-");   
            bitacora.executeBatch();
            //System.out.println("asasas119u09u9u*2-");
            update.executeBatch();
            //System.out.println("asasas119u09u9u*3-");
            deleteDetalleTarjeta.executeBatch();
            delete.executeBatch();
            //System.out.println("asasas119u09u9u*4-");
            this.con.commit();
        } catch (SQLException e) {
            //System.out.println("Salio Mal asasas119u09u9u*-");
            this.con.rollback();
            //System.out.println("Salio Mal asasas119u09u9u*-"+e);
            throw e;
        } finally {
            this.con.setAutoCommit(autoCommitStatus);
        }
    }

    /**
     * Metodo utilizado para aplicar el cambio de fechas a las guias
     * seleccionadas en el formulario. Actualiza tanto el registro en la tabla
     * guiadecarga como los registros de la tabla pagoscarga asociados a la guia
     *
     * @param codGuias Array con los guilcodigo de las guias a modificar
     * @param fechasGuias Array con las fechas ingresadas en el formulario,
     * previamente ordenadas para coincidir con el array codGuias
     * @throws SQLException
     */
    public void modificarFechasGuias(String[] codGuias, long[] fechasGuias) throws SQLException {
        if (!isConnected()) {
            throw new SQLException("Sin Conexion");
        }
        boolean autoCommitStatus = this.con.getAutoCommit();

        String updateGuiaCarga = "update guiadecarga set guidfecha = ? where guilcodigo = ?";
        String updatePagosCarga = "update pagoscarga set pagdtfecha = ? where guilcodigo = ?";

        this.con.setAutoCommit(false);
        PreparedStatement updateGuia = this.con.prepareStatement(updateGuiaCarga);

        PreparedStatement updatePagos = this.con.prepareStatement(updatePagosCarga);

        try {
            for (int i = 0; i < codGuias.length; i++) {
                updateGuia.setTimestamp(1, new java.sql.Timestamp(fechasGuias[i]));
                updateGuia.setLong(2, Long.parseLong(codGuias[i]));
                updateGuia.addBatch();

                updatePagos.setTimestamp(1, new java.sql.Timestamp(fechasGuias[i]));
                updatePagos.setLong(2, Long.parseLong(codGuias[i]));
                updatePagos.addBatch();
            }

            updateGuia.executeBatch();
            updatePagos.executeBatch();

            this.con.commit();
        } catch (SQLException e) {
            this.con.rollback();
            throw e;
        } finally {
            this.con.setAutoCommit(autoCommitStatus);
        }
    }

    private void actualizarGuiaFacturaSucursal(String serie, long nguia, String tipo) throws SQLException {
        String SQL = "";
        if (tipo.equals(TIPO_F)) {
            SQL = "UPDATE sucursales SET sucfactura=? WHERE sucsserie =?";
        } else if (tipo.equals(TIPO_G)) {
            SQL = "UPDATE sucursales SET sucguia=? WHERE sucsserie =?";
        }
        PreparedStatement update = this.con.prepareStatement(SQL);
        try {
            update.setLong(1, nguia);
            update.setString(2, serie);
            update.executeUpdate();
        } catch (SQLException e) {
            throw new SQLException("Error en la Actualizacion del numero de Guia o Factura: " + e.getMessage());
        }
    }

    public GuiaDeCargaDTO getDtoToPrint() {
        return dtoToPrint;
    }

    public void setDtoToPrint(GuiaDeCargaDTO dtoToPrint) {
        this.dtoToPrint = dtoToPrint;
    }

    public Guias validateGuiaFactura(Long guilnumero, String guisguiafactura)
            throws SQLException {
        if (!isConnected()) {
            throw new SQLException("Sin Conexion");
        }
        String SQL = "select  guilcodigO,guilNUmero,guidfecha,guiipiEZas,guinpeso,guiscontiene,guisremitente,guisdestinatario, guisruc,guistelefono,guincredito,clilcodigo,guissucursal,guiientregaen, guibentregadosino,fechagrabaentrega, usuarioentrega,guisobservacion,guisusuario, guinflete,guinedomicilio,guintransportea,guinseguro,guinotros,guindescuento,guiniva,guintotal, guiadecarga.prolsecuencial,guinpesovol,guinservicioa,guiihora,guiiminutos,guisguiafactura, guisdireccion,guisorigen,guisdestino,tiplsecuencial,'' as nombre,guindescuentop,guisestado   ,guistransito,guisserie , guinimpuio, guinimpgps, guinimpscy from guiadecarga  where guilnumero=? and guisguiafactura=? and guissucursal=? and guidfecha >= '2015-11-01'";

        PreparedStatement Buscar = this.con.prepareStatement(SQL);

        Guias guia = null;
        Usuarios usuario = getUsuarios();
        //System.out.println("alex9s>>>>");
        this.Lista = new LinkedList();
        ResultSet rs = null;
        try {
            Buscar.setLong(1, guilnumero);
            Buscar.setString(2, guisguiafactura.trim());
            Buscar.setString(3, usuario.getSucursal());

            rs = Buscar.executeQuery();

            while (rs.next()) {
                guia = Guias.load(rs);
                this.Lista.add(guia);
            }

        } finally {
            if (rs != null) {
                rs.close();
            }
        }
        return guia;
    }

    public void obtenerGuiasAnuladas(int diaini, int mesini, int anioini, int diafin, int mesfin, int aniofin)
            throws SQLException {
        String SQL = "";
        if (!isConnected()) {
            throw new SQLException("Sin Conexion");
        }
        Calendar inicio = Calendar.getInstance();
        inicio.set(anioini, mesini - 1, diaini);
        Date fechaini = inicio.getTime();

        Calendar fin = Calendar.getInstance();
        fin.set(aniofin, mesfin - 1, diafin);
        Date fechafin = fin.getTime();

        SQL = "select guilnumero,guidfecha,guiipiezas,guinpeso,guiscontiene,guisremitente,guisdestinatario,guincredito,guissucursal,"
                + " guisusuario,guinflete,guinseguro,guinotros,guiniva,guintotal,guisorigen,guisdestino"
                + " from bitacoraborradas where guidfecha>= ?  and guidfecha <= ? order by guilnumero asc";
        //and guisestado not like 'I'
        PreparedStatement BuscarGuiasAnuladas = this.con.prepareStatement(SQL);
        this.Lista2 = new LinkedList();
        ResultSet rs = null;
        try {
            BuscarGuiasAnuladas.setTimestamp(1, toTimestamp(fechaini));
            BuscarGuiasAnuladas.setTimestamp(2, toTimestamp(fechafin));

            rs = BuscarGuiasAnuladas.executeQuery();

            while (rs.next()) {
                this.Lista2.add(GuiasAnuladas.load(rs));
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
        }
    }
    
    
    public void obtenerDetFacturacionAR(int diaini, int mesini, int anioini, int diafin, int mesfin, int aniofin, int downloaded,int sinrestriccion)
     throws SQLException{
           String SQL = "";
           String SQLUpdate = "";
        if (!isConnected()) {
            throw new SQLException("Sin Conexion");
        }
        Calendar inicio = Calendar.getInstance();
        inicio.set(anioini, mesini - 1, diaini);
        Date fechaini = inicio.getTime();

        Calendar fin = Calendar.getInstance();
        fin.set(aniofin, mesfin - 1, diafin);
        Date fechafin = fin.getTime();
        int cont = 0;

        if(sinrestriccion==0){
            SQL = "SELECT 'LINE' AS Line_Type, 'TC'  AS Bath_Source, To_char(pagdtfecha, 'YYYYmmdd') AS Conversion_Date, 1 AS Conversion_Rate, To_char(current_date, 'YYYYmmdd') AS Creation_Date, 'USD' AS Currency_Code, 'FT' AS TRX_Type, To_char(Last_day(pagdtfecha), 'YYYYmmdd') AS Gl_Date, 3426 AS Org_Id, '790' || '020' || CASE WHEN detfranquicia = 'AX' THEN '20' WHEN detfranquicia = 'DC' THEN '22' WHEN detfranquicia = 'MC' THEN '24' WHEN detfranquicia = 'VI' THEN '25' END AS Orig_System_Address_Ref, 790 AS Salesrep_num, 'PRI' AS Printing_Option, 1 AS Quantity, 1712 AS Set_Of_Books, '' AS Tax_Code, To_char(pagdtfecha, 'YYYYmmdd') AS TRX_Date, To_char(pagdtfecha, 'ddmmYY') || detbanco|| '-'|| Rtrim(numero_cierre) || detfranquicia AS TRX_Number, pagnvalor AS Unit_Selling_Price, 'Servicio' AS UOM_Name, To_char(pagdtfecha, 'ddmmYY') || detbanco|| '-'|| Rtrim(numero_cierre) || detfranquicia|| '-CARGA' AS Description, pagnvalor AS Amount, '30 DIAS' AS Term_Name, '790'|| '020'|| CASE WHEN detfranquicia = 'AX' THEN '20' WHEN detfranquicia = 'DC' THEN '22' WHEN detfranquicia = 'MC' THEN '24' WHEN detfranquicia = 'VI' THEN '25' END AS Orig_System_Ref, 'TC-TDCGA'|| To_char(pagdtfecha, 'mmYY')|| Trim(To_char(id_detalletarjeta, '00000000')) AS Interface_Line_Attrib11 , '' AS Link_To_Line_Attribute1, 0 AS Tax_Rate, 'User' AS Conversion_Type, 'FACTURACION TC CARGA' AS Memo_line, 'N' As ENVIAACLIENTE, 'N' As FACTDIGITALIZADA, 'N' As LLEVASOPORTE, 'NA' As ZEROOCTA, 'SERVICIOS CGO' As TIPO_FACTURACION, ultimosdigitos AS Tc FROM   guiadecarga join pagoscarga ON guiadecarga.guilcodigo = pagoscarga.guilcodigo join detalletarjetacobro ON paglsecuencial = detpagocarga WHERE  pagdtfecha >= ? AND pagdtfecha <= ? AND downloaded = ?";
            SQLUpdate = "UPDATE detalletarjetacobro SET downloaded = 1 FROM pagoscarga WHERE paglsecuencial = detpagocarga AND pagdtfecha >= ? AND pagdtfecha <= ?";
        }
        if(sinrestriccion==1){
            SQL = "SELECT 'LINE' AS Line_Type, 'TC'  AS Bath_Source, To_char(pagdtfecha, 'YYYYmmdd') AS Conversion_Date, 1 AS Conversion_Rate, To_char(current_date, 'YYYYmmdd') AS Creation_Date, 'USD' AS Currency_Code, 'FT' AS TRX_Type, To_char(Last_day(pagdtfecha), 'YYYYmmdd') AS Gl_Date, 3426 AS Org_Id, '790' || '020' || CASE WHEN detfranquicia = 'AX' THEN '20' WHEN detfranquicia = 'DC' THEN '22' WHEN detfranquicia = 'MC' THEN '24' WHEN detfranquicia = 'VI' THEN '25' END AS Orig_System_Address_Ref, 790 AS Salesrep_num, 'PRI' AS Printing_Option, 1 AS Quantity, 1712 AS Set_Of_Books, '' AS Tax_Code, To_char(pagdtfecha, 'YYYYmmdd') AS TRX_Date, To_char(pagdtfecha, 'ddmmYY') || detbanco|| '-'|| Rtrim(numero_cierre) || detfranquicia AS TRX_Number, pagnvalor AS Unit_Selling_Price, 'Servicio' AS UOM_Name, To_char(pagdtfecha, 'ddmmYY') || detbanco|| '-'|| Rtrim(numero_cierre) || detfranquicia|| '-CARGA' AS Description, pagnvalor AS Amount, '30 DIAS' AS Term_Name, '790'|| '020'|| CASE WHEN detfranquicia = 'AX' THEN '20' WHEN detfranquicia = 'DC' THEN '22' WHEN detfranquicia = 'MC' THEN '24' WHEN detfranquicia = 'VI' THEN '25' END AS Orig_System_Ref, 'TC-TDCGA'|| To_char(pagdtfecha, 'mmYY')|| Trim(To_char(id_detalletarjeta, '00000000')) AS Interface_Line_Attrib11 , '' AS Link_To_Line_Attribute1, 0 AS Tax_Rate, 'User' AS Conversion_Type, 'FACTURACION TC CARGA' AS Memo_line, 'N' As ENVIAACLIENTE, 'N' As FACTDIGITALIZADA, 'N' As LLEVASOPORTE, 'NA' As ZEROOCTA, 'SERVICIOS CGO' As TIPO_FACTURACION, ultimosdigitos AS Tc FROM   guiadecarga join pagoscarga ON guiadecarga.guilcodigo = pagoscarga.guilcodigo join detalletarjetacobro ON paglsecuencial = detpagocarga WHERE  pagdtfecha >= ? AND pagdtfecha <= ? ";
        }
        PreparedStatement facturacion = this.con.prepareStatement(SQL);
        PreparedStatement chkDownloaded = this.con.prepareStatement(SQLUpdate);
        this.lista = new LinkedList();
        ResultSet rs = null;
        try {
            facturacion.setTimestamp(1, toTimestamp(fechaini));
            facturacion.setTimestamp(2, toTimestamp(fechafin));
            if(sinrestriccion==0){
                facturacion.setInt(3, downloaded);
            }
            rs = facturacion.executeQuery();

            while (rs.next()) {
                this.lista.add(DetFacturacion.load(rs));
                cont++;
            }
            
            if(cont>0){
                chkDownloaded.setTimestamp(1, toTimestamp(fechaini));
                chkDownloaded.setTimestamp(2, toTimestamp(fechafin));
                chkDownloaded.executeUpdate();
            }
        }
        catch(Exception ex){
                System.err.println("ERROR: " + ex.getMessage());
        } finally {
            if (rs != null) {
                rs.close();
            }
        }
    }
    
    
    public List getGuiasAnuladas() {
        return this.Lista2;
    }

    public float getResultadoCierre() {
        return resultadoCierre;
    }

    public void setResultadoCierre(float resultadoCierre) {
        this.resultadoCierre = resultadoCierre;
    }

    public DetalleCobroTarjeta getDetalleCobro() {
        return detalleCobro;
    }

    public void setDetalleCobro(DetalleCobroTarjeta detalleCobro) {
        this.detalleCobro = detalleCobro;
    }

    public String getExito() {
        return Exito;
    }

    public void setExito(String Exito) {
        this.Exito = Exito;
    }
    
    public void BuscarBancos()
            throws SQLException {
        if (!isConnected()) {
            throw new SQLException("Sin Conexion");
        }
        String SQL = "select iniciales, nombre_banco from bancos";

        PreparedStatement Buscar = this.con.prepareStatement(SQL);
        this.lista = new LinkedList();
        ResultSet rs = null;
        try {
            rs = Buscar.executeQuery();

            while (rs.next()) {
                this.lista.add(Bancos.load(rs));
            }

        } finally {
            if (rs != null) {
                rs.close();
            }
        }
    }
    
    public void BuscarFranquicias()
            throws SQLException {
        if (!isConnected()) {
            throw new SQLException("Sin Conexion");
        }
        String SQL = "select iniciales, nombre_franquicia from franquicias";

        PreparedStatement Buscar = this.con.prepareStatement(SQL);
        this.lista = new LinkedList();
        ResultSet rs = null;
        try {
            rs = Buscar.executeQuery();

            while (rs.next()) {
                this.lista.add(Franquicias.load(rs));
            }

        } finally {
            if (rs != null) {
                rs.close();
            }
        }
    }
    
    public List getlista(){
        return this.lista;
    }

    public int getIsLoadedTabledT() {
        return isLoadedTabledT;
    }

    public void setIsLoadedTabledT(int isLoadedTabledT) {
        this.isLoadedTabledT = isLoadedTabledT;
    }

    public String getDestinoCbx() {
        return DestinoCbx;
    }

    public void setDestinoCbx(String DestinoCbx) {
        this.DestinoCbx = DestinoCbx;
    }

    public String getClienteCbx() {
        return ClienteCbx;
    }

    public void setClienteCbx(String ClienteCbx) {
        this.ClienteCbx = ClienteCbx;
    }

    public int getIsNewGF() {
        return IsNewGF;
    }

    public void setIsNewGF(int IsNewGF) {
        this.IsNewGF = IsNewGF;
    }
    
}