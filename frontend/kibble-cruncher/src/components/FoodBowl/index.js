import React, {Component} from "react"
import Dogs from "../Dogs"
import PetFood from "../PetFood"
import './app.css'

export default class FoodBowl extends Component {
    render(){
        const {pets, foods, editPet, addPet, deleteFood, deletePet, addFood, editFoodAmount} = this.props

        return(
            <main>
                <Dogs editPet={editPet} addPet={addPet} deletePet={deletePet} pets={pets} addFood={addFood}/>
                <PetFood 
                foods={foods} 
                pets={pets} 
                deleteFood={deleteFood} 
                editFoodAmount={editFoodAmount}
            /> 
            </main>
        )
    }
}