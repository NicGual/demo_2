import React, { Fragment, useState, useRef, useEffect } from "react";
import './seguimiento.css'

export function Seguimiento() {
  return (
    <Fragment>
      <div className='sidenav'>
        <nav className="nav flex-column">
          <a href="/"> <img src="logo.svg" alt="logo" id="logo"/></a>
          <a className="nav-link active" href="/">Inicio</a>
          <a className="nav-link" href="registro-paquete">Registrar solicitud</a>
          <a className="nav-link" href="seguimiento">Seguimiento de solicitud</a>
          </nav>
      </div>
      <div className='main'>
      <blockquote className="blockquote text-center">

        <div className='container my-5 pb-3 titulo'>
          <h1>SEGUIMIENTO DE ENVIO</h1>
        </div>
        <div className='container py-5 parrafo'>
          <p>Ingrese en este campo el numero de su solicitud</p>
          <input type="text" placeholder="Rastrear solicitud..." />
          <button className="btn btn-primary ms-3">Buscar</button>
        </div>
        <div className='container px-auto py-5'>
        <table className="table">
          <thead className="table-active">
            <tr>
              <th scope='col'>Numero Solicitud</th>
              <th scope='col'>Fecha de solicitud</th>
              <th scope='col'>Ciudad Origen</th>
              <th scope='col'>Ciudad Destino</th>
              <th scope='col'>Estado</th>
            </tr>
          </thead>
          <tbody>
              <tr>
                <th scope='row'className="fw-normal parrafo2">1035236598</th>
                <th className="fw-normal parrafo2">22/09/2022</th>
                <th className="fw-normal parrafo2">Medellin</th>
                <th className="fw-normal parrafo2">Bogota</th>
                <th className="fw-normal parrafo2">Completado</th>
              </tr>
          </tbody>
        </table>
        </div>
        <div className='container my-5 parrafo'>
        <p>Su envio esta en proceso de entrega, recuerde que puede cancelar su solicitud hasta 22 horas despues de creada la misma</p>
        <button className='btn btn-danger'>Cancelar solicitud</button>
        </div>  
      </blockquote>
    </div>
 
  </Fragment>

  );
}
