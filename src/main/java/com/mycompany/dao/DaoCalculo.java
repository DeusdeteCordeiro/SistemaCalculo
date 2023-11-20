/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.dao;

import com.mycompany.ferramentas.BancoDeDadosMySql;

/**
 *
 * @author deusdete.2904
 */
public class DaoCalculo extends BancoDeDadosMySql{
    String sql;
    
    public  Boolean inserir(int seq, int id, int idCliente, int idIndice, String data, String historico, Double debito, Double credito, 
            Double saldo, Double taxaJuro, int dias, Double valorJuro, String debCred, int contCalc, Double saldoAnterior){
        try{
            sql =   "INSERT INTO CALCULO (SEQ, ID, ID_CLIENTE, ID_INDICE, DATA, HISTORICO, DEBITO, CREDITO, SALDO, TAXA_JURO, DIAS, VALOR_JURO) " +
                    "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            
            setStatement(getConexao().prepareStatement(sql));
            
            getStatement().setInt(1, seq);
            getStatement().setInt(2, id);
            getStatement().setInt(3, idCliente);
            getStatement().setInt(4, idIndice);
            getStatement().setString(5, data);
            getStatement().setString(6, historico);
            
            if(debCred.equals("D")){
                getStatement().setDouble(8, 0.0);
                getStatement().setDouble(7, debito);
            }
            else{
                getStatement().setDouble(8, credito);
                getStatement().setDouble(7, 0.0);
            }
            
            if(contCalc == 0){
                if(debCred.equals("D")){
                    getStatement().setDouble(9, -debito);
                }else{
                    getStatement().setDouble(9, debito);
                }
            }else{
                getStatement().setDouble(9, debito);
            }
                
            getStatement().setDouble(10, taxaJuro);
            getStatement().setInt(11, dias);
            getStatement().setDouble(12, valorJuro);
            
            getStatement().executeUpdate();
            
            return true;
        }catch(Exception e){
            System.out.println(e.getMessage());
            return false;
        }
    }
    
    public int buscarProximoId(){
        int id = 0;
        
        try{
            sql = "SELECT IFNULL(MAX(ID), 0) + 1 FROM CALCULO";
            
            setStatement(getConexao().prepareStatement(sql));
            
            setResultado(getStatement().executeQuery());
            
            getResultado().next(); //Move para o primeiro registro.
            
            id = getResultado().getInt(1); //Pega o valor retornado na consulta
        }catch(Exception e){
            System.out.println(e.getMessage());
        }
        
        return id;
    }
    
    public int buscarUltimoSeq(){
        int id = 0;
        
        try{
            sql = "SELECT IFNULL(MAX(SEQ), 0) FROM CALCULO";
            
            setStatement(getConexao().prepareStatement(sql));
            
            setResultado(getStatement().executeQuery());
            
            getResultado().next(); //Move para o primeiro registro.
            
            id = getResultado().getInt(1); //Pega o valor retornado na consulta
        }catch(Exception e){
            System.out.println(e.getMessage());
        }
        
        return id;
    }
    
    public int contCalculo(int idCalculo){
        int id = 0;
        
        try{
            sql = "SELECT COUNT(ID) FROM CALCULO WHERE ID = ?";
            
            setStatement(getConexao().prepareStatement(sql));
            
            getStatement().setInt(1, idCalculo);
            
            setResultado(getStatement().executeQuery());
            
            getResultado().next(); //Move para o primeiro registro.
            
            id = getResultado().getInt(1); //Pega o valor retornado na consulta
        }catch(Exception e){
            System.out.println(e.getMessage());
        }
        
        return id;
    }
}
