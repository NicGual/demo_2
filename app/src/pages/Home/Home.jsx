import React, { Component } from 'react'
import {
    Form,
    Button,
    Container,
    Row,
    Col,
  } from "react-bootstrap";
  import NavbarComp from "../../components/NavbarComp/NavbarComp.jsx";
  import "../../pages/Home/Home.css";

export default class Home extends Component {
  render() {
    return (
      <div>
        <NavbarComp/>
        <Container>
          <Row className="justify-content-md-center">
            <Col className="rectangulo"></Col>
            <Col className="tituloHome">Mundo de Soluciones</Col>
            <Col></Col>
          </Row>
          <Row className="justify-content-md-center">
            <Col className="rectangulo"></Col>
            <Col className="slogan">
              Transporte, entrega y logística física o digital para ti o tu
              empresa a tiempo.
            </Col>
            <Col></Col>
          </Row>
          <Row className="justify-content-md-center">
            <Col className="rectangulo"></Col>
            <Col className="slogan2">¡Lo tenemos todo!</Col>
            <object className="rectangulo1guia"></object>
            <object className="consultar">Consultar</object>
            <object className="separador">|</object>
            <Form.Control className="rectanguloguia" type="email" placeholder="Ingresa el # de guia" />
            <a href="/seguimiento"><Button className="buscar"><img className="path" src="/assets/buscar.svg" width="10.23px" height="17.89px"/></Button></a>        
            <object className="imagen" data="/assets/Envios.svg"></object>
          </Row>
        </Container>
      </div>
    )
  }
}
