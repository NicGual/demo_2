import React from "react";
import "./CustomInput.css"
const CustomInput = ({type="text", placeholder="", name="",  id=""}) => {
    return(
        <>
            <div>
                <input className="custom-input" type={type} placeholder={placeholder} name={name} id={id}/>
            </div>
        </>
    )
} 
export default CustomInput