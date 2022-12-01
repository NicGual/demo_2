import React from "react";
import "./CustomButton.css"
const CustomButton = ({type="", placeholder="", className="", id="", onclick}) => {
    return(
        <>
            <div className={`${className} button-container`}>
                <button className="custom-button" id={id} type={type} onClick={(e)=> {
                    
                    onclick(e)}}>
                        {placeholder}
                </button>
            </div>
        </>
    )
} 
export default CustomButton