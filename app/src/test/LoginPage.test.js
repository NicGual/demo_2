import { render, screen, fireEvent } from '@testing-library/react';
import CustomButton from '../components/CustomButton/CustomButton'
import Login from '../pages/Login/Login';
describe('CustomButton component', () => {

    beforeEach(() => {
        render(<Login/>);  
    })

    test('Check Login Button', () => {
        const loginButton = screen.getByRole('button', { name: 'Iniciar Sesion' });
        expect(loginButton).toBeInTheDocument();
        fireEvent.click(loginButton)
    });

    test('Check Sign Up Button', () => {
        const registerButton = screen.getByRole('button', { name: 'Crear Cuenta' });   
        expect(registerButton).toBeInTheDocument();
        fireEvent.click(registerButton)
    });
    
});