/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package student;

import funkcionalnosti.Funkcionalnosti;
import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.LinkedList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import student.util.DB;

/**
 *
 * @author stefan
 */
public class Zd130033 extends Funkcionalnosti{

    @Override
    public int unesiGradiliste(String naziv, Date datumOsnivanja) {
        PreparedStatement preparedStatement = null; 
        final int ERROR_CODE = -1;
        
        try {
            String query = "INSERT INTO Gradiliste (Naziv, DatumOsnivanja, BrojObjekata)" 
                            + "VALUES ( ?, ?, 0)";
            Connection connection = DB.getConnection();
            
            preparedStatement = connection.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
            preparedStatement.setString(1, naziv);
            preparedStatement.setDate(2, datumOsnivanja);
            preparedStatement.executeUpdate();
            ResultSet resultSet = preparedStatement.getGeneratedKeys();
            if (resultSet.next())
            {
                return resultSet.getInt(1);
            }
            else
            {
                return ERROR_CODE;
            }
        } catch (SQLException ex) {
            Logger.getLogger(Zd130033.class.getName()).log(Level.SEVERE, null, ex);
            return ERROR_CODE;
        }
        finally
        {
            if (preparedStatement != null)
            {
                try {
                    preparedStatement.close();
                } catch (SQLException ex) {
                    Logger.getLogger(Zd130033.class.getName()).log(Level.SEVERE, null, ex);
                    return ERROR_CODE;
                }
            }
        }
    }

    @Override
    public int obrisiGradiliste(int idGradiliste) {
        final int ERROR_CODE = 1;
        final int OK_CODE = 0;
        PreparedStatement preparedStatement = null;
        try {
            String query = "DELETE FROM Gradiliste WHERE IDGradiliste = ?";
            Connection connection = DB.getConnection();
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, idGradiliste);
            preparedStatement.executeUpdate();
            return OK_CODE;
        } catch (SQLException ex) {
            Logger.getLogger(Zd130033.class.getName()).log(Level.SEVERE, null, ex);
            return ERROR_CODE;
        }
        finally
        {
            if (preparedStatement != null)
            {
                try {
                    preparedStatement.close();
                } catch (SQLException ex) {
                    Logger.getLogger(Zd130033.class.getName()).log(Level.SEVERE, null, ex);
                    return ERROR_CODE;
                }
            }
        }
        
        
        
    }

    @Override
    public List<Integer> dohvatiSvaGradilista() {
        final List<Integer> ERROR_CODE = null;
        PreparedStatement preparedStatement = null;
        try {
            String query = "SELECT IDGradiliste Id FROM Gradiliste";
            Connection connection = DB.getConnection();
            preparedStatement = connection.prepareStatement(query);
            ResultSet resultSet = preparedStatement.executeQuery();
            LinkedList <Integer> listIdGrad = new LinkedList<>();
            while (resultSet.next())
            {
                listIdGrad.addLast(resultSet.getInt("Id"));
            }
            if (listIdGrad.isEmpty())
            {
                return ERROR_CODE;
            }
            return listIdGrad;
        } catch (SQLException ex) {
            Logger.getLogger(Zd130033.class.getName()).log(Level.SEVERE, null, ex);
            return ERROR_CODE;
        }
        finally
        {
            if (preparedStatement != null)
            {
                try {
                    preparedStatement.close();
                } catch (SQLException ex) {
                    Logger.getLogger(Zd130033.class.getName()).log(Level.SEVERE, null, ex);
                    return ERROR_CODE;
                }
            }
        }
    }

    @Override
    public int unesiObjekat(String naziv, int idGradiliste) {
         PreparedStatement preparedStatement = null; 
        final int ERROR_CODE = -1;
        
        try {
            String query = "INSERT INTO Objekat (Naziv, IDGradiliste, BrojSpratova)" 
                            + "VALUES ( ?, ?, 0)";
            Connection connection = DB.getConnection();
            
            preparedStatement = connection.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
            preparedStatement.setString(1, naziv);
            preparedStatement.setInt(2, idGradiliste);
            preparedStatement.executeUpdate();
            ResultSet resultSet = preparedStatement.getGeneratedKeys();
            if (resultSet.next())
            {
                return resultSet.getInt(1);
            }
            else
            {
                return ERROR_CODE;
            }
        } catch (SQLException ex) {
            Logger.getLogger(Zd130033.class.getName()).log(Level.SEVERE, null, ex);
            return ERROR_CODE;
        }
        finally
        {
            if (preparedStatement != null)
            {
                try {
                    preparedStatement.close();
                } catch (SQLException ex) {
                    Logger.getLogger(Zd130033.class.getName()).log(Level.SEVERE, null, ex);
                    return ERROR_CODE;
                }
            }
        }
    }

    @Override
    public int obrisiObjekat(int idObjekat) {
        final int ERROR_CODE = 1;
        final int OK_CODE = 0;
        PreparedStatement preparedStatement = null;
        try {
            String query = "DELETE FROM Objekat WHERE IDObjekat = ?";
            Connection connection = DB.getConnection();
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, idObjekat);
            preparedStatement.executeUpdate();
            return OK_CODE;
        } catch (SQLException ex) {
            Logger.getLogger(Zd130033.class.getName()).log(Level.SEVERE, null, ex);
            return ERROR_CODE;
        }
        finally
        {
            if (preparedStatement != null)
            {
                try {
                    preparedStatement.close();
                } catch (SQLException ex) {
                    Logger.getLogger(Zd130033.class.getName()).log(Level.SEVERE, null, ex);
                    return ERROR_CODE;
                }
            }
        }
        
    }
    
    private int brojSpratova(int idObjekat)
    {
        PreparedStatement preparedStatement = null; 
        final int ERROR_CODE = -1;
        
        try {
            String query = "SELECT BrojSpratova brSpratova FROM Objekat WHERE IDObjekat = ?";
            Connection connection = DB.getConnection();
            
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, idObjekat);
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next())
            {
                return resultSet.getInt("brSpratova");
            }
            else
            {
                return ERROR_CODE;
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(Zd130033.class.getName()).log(Level.SEVERE, null, ex);
            return ERROR_CODE;
        }
        finally
        {
            if (preparedStatement != null)
            {
                try {
                    preparedStatement.close();
                } catch (SQLException ex) {
                    Logger.getLogger(Zd130033.class.getName()).log(Level.SEVERE, null, ex);
                    return ERROR_CODE;
                }
            }
        }
    }

    @Override
    public int unesiSprat(int brSprata, int idObjekat) {
        PreparedStatement preparedStatement = null; 
        final int ERROR_CODE = -1;
        int brojSpratovaObjekta = brojSpratova(idObjekat);
        if (brojSpratovaObjekta != brSprata)
        {
            return ERROR_CODE;
        }
        
        try {
            String query = "INSERT INTO Sprat (RedniBroj, IDObjekat)" 
                            + "VALUES ( ?, ?)";
            Connection connection = DB.getConnection();
            
            preparedStatement = connection.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
            preparedStatement.setInt(1, brSprata);
            preparedStatement.setInt(2, idObjekat);
            preparedStatement.executeUpdate();
            ResultSet resultSet = preparedStatement.getGeneratedKeys();
            if (resultSet.next())
            {
                return resultSet.getInt(1);
            }
            else
            {
                return ERROR_CODE;
            }
        } catch (SQLException ex) {
            Logger.getLogger(Zd130033.class.getName()).log(Level.SEVERE, null, ex);
            return ERROR_CODE;
        }
        finally
        {
            if (preparedStatement != null)
            {
                try {
                    preparedStatement.close();
                } catch (SQLException ex) {
                    Logger.getLogger(Zd130033.class.getName()).log(Level.SEVERE, null, ex);
                    return ERROR_CODE;
                }
            }
        }
    }

    @Override
    public int obrisiSprat(int idSprat) {
         final int ERROR_CODE = 1;
        final int OK_CODE = 0;
        PreparedStatement preparedStatement = null;
        try {
            String query = "DELETE FROM Sprat WHERE IDSprat = ?";
            Connection connection = DB.getConnection();
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, idSprat);
            preparedStatement.executeUpdate();
            return OK_CODE;
        } catch (SQLException ex) {
            Logger.getLogger(Zd130033.class.getName()).log(Level.SEVERE, null, ex);
            return ERROR_CODE;
        }
        finally
        {
            if (preparedStatement != null)
            {
                try {
                    preparedStatement.close();
                } catch (SQLException ex) {
                    Logger.getLogger(Zd130033.class.getName()).log(Level.SEVERE, null, ex);
                    return ERROR_CODE;
                }
            }
        }
    }

    @Override
    public int unesiZaposlenog(String ime, String prezime, String jmbg, String pol, String ziroRacun, String email, String brojTelefona) {
        PreparedStatement preparedStatement = null; 
        final int ERROR_CODE = -1;
        try {
            String query = "INSERT INTO Zaposleni(Ime, Prezime, JMBG, ZiroRacun, "
                    + "Email, BrojTelefona, ProsecnaOcena, BrojZaduzeneOpreme, "
                    + "IsplaceniIznos, IDMagacin, Pol) "
                    + "VALUES (?, ?, ?, ?, ?, ?, 10, 0, 0, "
                    + "NULL, ?)";
            Connection connection = DB.getConnection();
            
            preparedStatement = connection.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
            preparedStatement.setString(1, ime);
            preparedStatement.setString(2, prezime);
            preparedStatement.setString(3, jmbg);
            preparedStatement.setString(4, ziroRacun);
            preparedStatement.setString(5, email);
            preparedStatement.setString(6, brojTelefona);
            preparedStatement.setString(7, pol);
            preparedStatement.executeUpdate();
            ResultSet resultSet = preparedStatement.getGeneratedKeys();
            if (resultSet.next())
            {
                return resultSet.getInt(1);
            }
            else
            {
                return ERROR_CODE;
            }
        } catch (SQLException ex) {
            Logger.getLogger(Zd130033.class.getName()).log(Level.SEVERE, null, ex);
            return ERROR_CODE;
        }
        finally
        {
            if (preparedStatement != null)
            {
                try {
                    preparedStatement.close();
                } catch (SQLException ex) {
                    Logger.getLogger(Zd130033.class.getName()).log(Level.SEVERE, null, ex);
                    return ERROR_CODE;
                }
            }
        }
    }

    @Override
    public int obrisiZaposlenog(int idZaposleni) {
         final int ERROR_CODE = 1;
        final int OK_CODE = 0;
        PreparedStatement preparedStatement = null;
        try {
            String query = "DELETE FROM Zaposleni WHERE IDZaposleni = ?";
            Connection connection = DB.getConnection();
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, idZaposleni);
            preparedStatement.executeUpdate();
            return OK_CODE;
        } catch (SQLException ex) {
            Logger.getLogger(Zd130033.class.getName()).log(Level.SEVERE, null, ex);
            return ERROR_CODE;
        }
        finally
        {
            if (preparedStatement != null)
            {
                try {
                    preparedStatement.close();
                } catch (SQLException ex) {
                    Logger.getLogger(Zd130033.class.getName()).log(Level.SEVERE, null, ex);
                    return ERROR_CODE;
                }
            }
        }
        
    }

    @Override
    public BigDecimal dohvatiUkupanIsplacenIznosZaZaposlenog(int idZaposleni) {
         final BigDecimal ERROR_CODE = new BigDecimal(-1.0);
        PreparedStatement preparedStatement = null;
        try {
            String query = "SELECT IsplaceniIznos iznos FROM Zaposleni "
                    + "WHERE IDZaposleni= ?";
            Connection connection = DB.getConnection();
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, idZaposleni);
            ResultSet resultSet = preparedStatement.executeQuery();
            if (!resultSet.next())
            {
                return ERROR_CODE;
            }
            else
            {
                return resultSet.getBigDecimal("iznos");
            }
        } catch (SQLException ex) {
            Logger.getLogger(Zd130033.class.getName()).log(Level.SEVERE, null, ex);
            return ERROR_CODE;
        }
        finally
        {
            if (preparedStatement != null)
            {
                try {
                    preparedStatement.close();
                } catch (SQLException ex) {
                    Logger.getLogger(Zd130033.class.getName()).log(Level.SEVERE, null, ex);
                    return ERROR_CODE;
                }
            }
        }
    }

    @Override   
    public BigDecimal dohvatiProsecnuOcenuZaZaposlenog(int idZaposleni) {
         final BigDecimal ERROR_CODE = new BigDecimal(-1.0);
        PreparedStatement preparedStatement = null;
        try {
            String query = "SELECT ProsecnaOcena prosecna FROM Zaposleni "
                    + "WHERE IDZaposleni= ?";
            Connection connection = DB.getConnection();
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, idZaposleni);
            ResultSet resultSet = preparedStatement.executeQuery();
            if (!resultSet.next())
            {
                return ERROR_CODE;
            }
            else
            {
                return resultSet.getBigDecimal("prosecna");
            }
        } catch (SQLException ex) {
            Logger.getLogger(Zd130033.class.getName()).log(Level.SEVERE, null, ex);
            return ERROR_CODE;
        }
        finally
        {
            if (preparedStatement != null)
            {
                try {
                    preparedStatement.close();
                } catch (SQLException ex) {
                    Logger.getLogger(Zd130033.class.getName()).log(Level.SEVERE, null, ex);
                    return ERROR_CODE;
                }
            }
        }
    }

    @Override
    public int dohvatiBrojTrenutnoZaduzeneOpremeZaZaposlenog(int idZaposleni) {
        final int ERROR_CODE = -1;
        PreparedStatement preparedStatement = null;
        try {
            String query = "SELECT BrojZaduzeneOpreme zaduzen FROM Zaposleni "
                    + "WHERE IDZaposleni= ?";
            Connection connection = DB.getConnection();
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, idZaposleni);
            ResultSet resultSet = preparedStatement.executeQuery();
            if (!resultSet.next())
            {
                return ERROR_CODE;
            }
            else
            {
                return resultSet.getInt("zaduzen");
            }
        } catch (SQLException ex) {
            Logger.getLogger(Zd130033.class.getName()).log(Level.SEVERE, null, ex);
            return ERROR_CODE;
        }
        finally
        {
            if (preparedStatement != null)
            {
                try {
                    preparedStatement.close();
                } catch (SQLException ex) {
                    Logger.getLogger(Zd130033.class.getName()).log(Level.SEVERE, null, ex);
                    return ERROR_CODE;
                }
            }
        }
    }

    @Override
    public List<Integer> dohvatiSveZaposlene() {
         final List<Integer> ERROR_CODE = null;
        PreparedStatement preparedStatement = null;
        try {
            String query = "SELECT IDZaposleni Id FROM Zaposleni";
            Connection connection = DB.getConnection();
            preparedStatement = connection.prepareStatement(query);
            ResultSet resultSet = preparedStatement.executeQuery();
            LinkedList <Integer> listIdGrad = new LinkedList<>();
            while (resultSet.next())
            {
                listIdGrad.addLast(resultSet.getInt("Id"));
            }
            if (listIdGrad.isEmpty())
            {
                return ERROR_CODE;
            }
            return listIdGrad;
        } catch (SQLException ex) {
            Logger.getLogger(Zd130033.class.getName()).log(Level.SEVERE, null, ex);
            return ERROR_CODE;
        }
        finally
        {
            if (preparedStatement != null)
            {
                try {
                    preparedStatement.close();
                } catch (SQLException ex) {
                    Logger.getLogger(Zd130033.class.getName()).log(Level.SEVERE, null, ex);
                    return ERROR_CODE;
                }
            }
        }
    }

    @Override
    public int unesiMagacin(int idSef, BigDecimal plata, int idGradiliste) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int obrisiMagacin(int idMagacin) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int izmeniSefaZaMagacin(int idMagacin, int idSefNovo) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int izmeniPlatuZaMagacin(int idMagacin, BigDecimal plataNovo) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int isplatiPlateZaposlenimaUSvimMagacinima() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int isplatiPlateZaposlenimaUMagacinu(int idMagacin) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int unesiRobuUMagacinPoKolicini(int idRoba, int idMagacin, BigDecimal kolicina) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int unesiRobuUMagacinPoBrojuJedinica(int idRoba, int idMagacin, int brojJedinica) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public BigDecimal uzmiRobuIzMagacinaPoKolicini(int idRoba, int idMagacin, BigDecimal kolicina) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int uzmiRobuIzMagacinaPoBrojuJedinica(int idRoba, int idMagacin, int brojJedinca) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public BigDecimal pogledajKolicinuRobeUMagacinu(int idRoba, int idMagacin) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int pogledajBrojJedinicaRobeUMagacinu(int idRoba, int idMagacin) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    private static final int HTZ_IDX = 0;
    private static final int ALAT_IDX = 1;
    private static final int MAT_IDX = 2;
    
    private static final String TIP_ROBE [] = new String[]
                        {
                            "HTZ",
                            "alat",
                            "materijal"
                        };
    
    @Override
    public int unesiTipRobe(String naziv) {
        final int ERROR_CODE = -1;
        for (int idx = 0; idx < TIP_ROBE.length; idx ++)
        {
            if (TIP_ROBE[idx].equals(naziv))
            {
                return idx;
            }
        }
        return ERROR_CODE;
    }

    @Override
    public int obrisiTipRobe(int idTipRobe) {
        final int OK_CODE = 0;
        return OK_CODE;
    }

    @Override
    public int unesiRobu(String naziv, String kod, int idTipRobe) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int obrisiRobu(int idRoba) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<Integer> dohvatiSvuRobu() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int zaposleniRadiUMagacinu(int idZaposleni, int idMagacin) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int zaposleniNeRadiUMagacinu(int idZaposleni) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int zaposleniZaduzujeOpremu(int idZaposlenogKojiZaduzuje, int idMagacin, int idRoba, Date datumZaduzenja, String napomena) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int zaposleniRazduzujeOpremu(int idZaduzenjaOpreme, Date datumRazduzenja) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int unesiNormuUgradnogDela(String naziv, BigDecimal cenaIzrade, BigDecimal jedinicnaPlataRadnika) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int obrisiNormuUgradnogDela(int idNormaUgradnogDela) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public BigDecimal dohvatiJedinicnuPlatuRadnikaNormeUgradnogDela(int idNR) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int unesiPotrebanMaterijalPoBrojuJedinica(int idRobaKojaJePotrosniMaterijal, int idNormaUgradnogDela, int brojJedinica) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int unesiPotrebanMaterijalPoKolicini(int idRobaKojaJePotrosniMaterijal, int idNormaUgradnogDela, BigDecimal kolicina) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int obrisiPotrebanMaterijal(int idRobaKojaJePotrosniMaterijal, int idNormaUgradnogDela) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int unesiPosao(int idNormaUgradnogDela, int idSprat, Date datumPocetka) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int obrisiPosao(int idPosao) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int izmeniDatumPocetkaZaPosao(int idPosao, Date datumPocetka) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int zavrsiPosao(int idPosao, Date datumKraja) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int zaposleniRadiNaPoslu(int idZaposleni, int idPosao, Date datumPocetka) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int zaposleniJeZavrsioSaRadomNaPoslu(int idZaposleniNaPoslu, Date datumKraja) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int izmeniDatumPocetkaRadaZaposlenogNaPoslu(int idZaposleniNaPoslu, Date datumPocetkaNovo) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int izmeniDatumKrajaRadaZaposlenogNaPoslu(int idZaposleniNaPoslu, Date datumKrajaNovo) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int zaposleniDobijaOcenu(int idZaposleniNaPoslu, int ocena) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int obrisiOcenuZaposlenom(int idZaposleniNaPoslu) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int izmeniOcenuZaZaposlenogNaPoslu(int idZaposleniNaPoslu, int ocenaNovo) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
}
