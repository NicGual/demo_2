import { render, screen, fireEvent } from '@testing-library/react';
import {Seguimiento} from '../pages/Seguimiento/Seguimiento'
describe('CustomButton component', () => {

    beforeEach(() => {
        render(<Seguimiento/>);  
    })

    test('Check Search Button', () => {
        const searchButton = screen.getByRole('button', { name: 'Buscar' });
        expect(searchButton).toBeInTheDocument();
        fireEvent.click(searchButton)
    });

    test('Check Cancel Button', () => {
        const cancelButton = screen.getByRole('button', { name: 'Cancelar solicitud' });   
        expect(cancelButton).toBeInTheDocument();
        fireEvent.click(cancelButton)
    });
    
});