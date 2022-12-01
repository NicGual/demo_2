import React, { useState } from "react";
import { Formik, Form, Field, ErrorMessage } from "formik";
import "./registroPaquete.css";
import NavBarComp from "../../components/NavbarComp/NavbarComp";

const Formulario = () => {
  const [formularioEnviado, cambiarFormularioEnviado] = useState(false);
  return (
    <>
      {/* <NavBarComp> </NavBarComp> */}
      <div className='sidenav'>
        <nav className="nav flex-column">
          <a href="/"> <img src="logo.svg" alt="logo" id="logo" /></a>
          <a className="nav-link active" href="/">Inicio</a>
          <a className="nav-link" href="registro-paquete">Registrar solicitud</a>
          <a className="nav-link" href="seguimiento">Seguimiento de solicitud</a>
        </nav>
      </div>
      <div className="main">
        <header>
          {" "}
          <div className="Cabecera d-flex justify-content-center">
            {" "}
            <h1 className="mt-3"> REGISTRO DE PAQUETE </h1>{" "}
          </div>{" "}
        </header>
        <div className="cuadro"> </div>
        <div className="container">
          <Formik
            initialValues={{
              dimensionPaquete: "",
              ciudadPartida: "",
              ciudadDestino: "",
              remitente: "",
              direccionRecibe: "",
              pesoPaquete: "",
              envioRapido: "",
            }}
            validate={(valores) => {
              let errores = {};

              return errores;
            }}
            onSubmit={(valores, { resetForm }) => {
              resetForm();
              console.log("Formulario enviado");
              cambiarFormularioEnviado(true);
              setTimeout(() => cambiarFormularioEnviado(false), 5000);
            }}
          >
            {({ errors }) => (
              <Form className="formulario">
                <form>
                  <label>
                    <h4> Ingrese descripcion del paquete: </h4>
                    {/* <input type="text" name="name" /> */}
                    <textarea name="name"  cols="10" rows="3"></textarea>
                  </label>
                </form>
                <div>
                  <div className="enunciados">
                    {" "}
                    <label htmlFor="dimensionPaquete">
                      Dimensiones del paquete
                    </label>{" "}
                  </div>
                  <div className="campos">
                    {" "}
                    <Field
                      type="text"
                      id="dimensionPaquete"
                      name="dimensionPaquete"
                      placeholder="1x1 cm"
                    />{" "}
                  </div>
                  <ErrorMessage
                    name="dimensionPaquete"
                    component={() => (
                      <div className="error">{errors.dimensionPaquete}</div>
                    )}
                  />
                </div>
                <div>
                  <div className="enunciados">
                    {" "}
                    <label htmlFor="ciudadPartida">Ciudad de Partida</label>{" "}
                  </div>
                  <div className="campos">
                    {" "}
                    <Field
                      type="text"
                      id="ciudadPartida"
                      name="ciudadPartida"
                      placeholder="Bogota"
                    />{" "}
                  </div>
                  <ErrorMessage
                    name="ciudadPartida"
                    component={() => (
                      <div className="error">{errors.ciudadPartida}</div>
                    )}
                  />
                </div>
                <div>
                  <div className="enunciados">
                    {" "}
                    <label htmlFor="ciudadDestino">Ciudad de destino</label>{" "}
                  </div>
                  <div className="campos">
                    <Field
                      type="text"
                      id="ciudadDestino"
                      name="ciudadDestino"
                      placeholder="Tunja"
                    />{" "}
                  </div>
                  <ErrorMessage
                    name="ciudadDestino"
                    component={() => (
                      <div className="error">{errors.ciudadDestino}</div>
                    )}
                  />
                </div>
                <div>
                  <div className="enunciados">
                    {" "}
                    <label htmlFor="remitente">Remitente</label>{" "}
                  </div>
                  <div className="campos">
                    <Field
                      type="text"
                      id="remitente"
                      name="remitente"
                      placeholder="Pancracia Tocarruncho"
                    />{" "}
                  </div>
                  <ErrorMessage
                    name="remitente"
                    component={() => (
                      <div className="error">{errors.remitente}</div>
                    )}
                  />
                </div>
                <div>
                  <div className="enunciados">
                    {" "}
                    <label htmlFor="direccionRecibe">
                      Direccion de recibo
                    </label>{" "}
                  </div>
                  <div className="campos">
                    <Field
                      type="text"
                      id="direccionRecibe"
                      name="direccionRecibe"
                      placeholder="fake street 123"
                    />{" "}
                  </div>
                  <ErrorMessage
                    name="direccionRecibe"
                    component={() => (
                      <div className="error">{errors.direccionRecibe}</div>
                    )}
                  />
                </div>
                <div>
                  <div className="enunciados">
                    {" "}
                    <label htmlFor="pesoPaquete">Peso del paquete</label>{" "}
                  </div>
                  <div className="campos">
                    {" "}
                    <Field
                      type="text"
                      id="pesoPaquete"
                      name="pesoPaquete"
                      placeholder="1kg"
                    />{" "}
                  </div>
                  <ErrorMessage
                    name="pesoPaquete"
                    component={() => (
                      <div className="error">{errors.pesoPaquete}</div>
                    )}
                  />
                </div>
                <div>
                  <label htmlFor="EnvioRapido">
                    {" "}
                    Envio Rapido
                    <Field type="radio" name="envioRapido" value="Si" /> Si
                    <Field type="radio" name="envioRapido" value="No" /> No
                  </label>
                </div>

                <button type="submit">Enviar</button>
                {formularioEnviado && (
                  <p className="exito">Formulario enviado con exito!</p>
                )}
              </Form>
            )}
          </Formik>
        </div>

      </div>

    </>
  );
};

export default Formulario;
