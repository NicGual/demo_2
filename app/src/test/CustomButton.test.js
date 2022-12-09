import { render, screen, fireEvent } from '@testing-library/react';
import CustomButton from '../components/CustomButton/CustomButton'

describe('CustomButton component', () => {

    let button;
    beforeEach(() => {
        render(<CustomButton className="col-md-10" type="submit" placeholder="Iniciar Sesion" />);
        button = screen.getByRole('button', { name: 'Iniciar Sesionnn' });
    })

    test('The button renders', () => {
        expect(button).toBeInTheDocument();
        fireEvent.click(button)
    });
    
});