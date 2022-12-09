import { render, screen, fireEvent } from '@testing-library/react';
import Registro from '../pages/Registro/Registro'
describe('CustomButton component', () => {

    beforeEach(() => {
        render(<Registro/>);  
    })

    test('Check Login Button', () => {
        const loginButton = screen.getByRole('button', { name: 'Iniciar Sesion' });
        expect(loginButton).toBeInTheDocument();
        fireEvent.click(loginButton)
    });

    test('Check Sign Up Button', () => {
        const registerButton = screen.getByRole('button', { name: 'Registrarse' });   
        expect(registerButton).toBeInTheDocument();
        fireEvent.click(registerButton)
    });
    
});