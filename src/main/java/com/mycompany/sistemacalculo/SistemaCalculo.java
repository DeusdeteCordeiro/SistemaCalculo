/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 */

package com.mycompany.sistemacalculo;

import com.mycompany.ferramentas.BancoDeDadosMySql;

/**
 *
 * @author deusdete.2904
 */
public class SistemaCalculo {

    public static void main(String[] args) {
        if (BancoDeDadosMySql.conectar())
            System.out.println("Banco de dados conectado com sucesso!");
        else
            System.out.println("Não foi possível conectar ao banco de dados. O sistema será finalizado.");
    }
}
