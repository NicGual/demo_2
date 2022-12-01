import React from "react";
import CustomButton from "../../components/CustomButton/CustomButton";
import CustomInput from "../../components/CustomInput/CustomInput";
import './Login.css'
const Login = () => {
    const iniciarSesion = (e) => {
        e.preventDefault()
        const formulario = {}
        formulario.nombreUsuario= document.getElementById("correo").value
        formulario.contraseña= document.getElementById("contraseña").value
        console.log(formulario)
    }
    const redireccionRegistro = () =>{
        window.location.href="/registro"
    }
    return (
        <>
            <div className="login-page d-flex container">
                <section className="m-8">
                    <div className="frase">
                        <h2>Envios a un <span>CLICK</span>  de distancia</h2>
                    </div>
                    <div className="p-4">
                        <img className="delivery-foto pt-4" src="login-instaya.png" alt="delivery" />
                    </div>
                </section>
                <section className="login-form my-auto mx-auto p-4">
                    <div className="logo d-flex justify-content-center mb-5 mt-3">
                        <a href="/"><img src="logo.png" alt="logo" /></a>
                    </div>
                    <form className="d-flex justify-content-center form-group row mb-5">
                        <div className=" mb-3 col-md-10">
                            <CustomInput placeholder="Correo" type="email" name="correo" id="correo"/>
                        </div>
                        <div className=" mb-3 col-md-10">
                            <CustomInput placeholder="Contraseña" type="password" name="contraseña" id="contraseña"/>
                        </div>                       
                        <div class="row d-flex justify-content-center mb-4 mt-4">
                            <CustomButton className="col-md-10" type="submit" placeholder="Iniciar Sesion" onclick={iniciarSesion}/>
                        </div>
                    </form>
                    <div className="row d-flex justify-content-center mt-5">
                        <div className="text-center">
                            <h6 className="crear-cuenta-frase p-2 fw-bold">¿no tienes una cuenta? crea una ahora mismo</h6>
                        </div>                        
                        <div class="row d-flex justify-content-center mb-4">
                            <CustomButton className="col-md-10"  placeholder="Crear Cuenta" onclick={redireccionRegistro}/>
                        </div>
                    </div>
                </section>
            </div>
        </>
    )
}
export default Login