import React, {Component} from "react"
import Dogs from "../Dogs"
import PetFood from "../PetFood"
import './app.css'

export default class FoodBowl extends Component {
    // state = {
    //     foods: []
    // }

    // deleteFood = (id) => {
    //     this.props.deleteFood(id)
    //     const newState = this.state.foods.filter(f => f.id !== id)
    //     this.setState({foods: newState})
    // }

    // componentDidMount(){
    //     this.props.pets.map(pet => {
    //         pet.attributes.foods.map(food => {
    //             this.setState({foods: [...this.state.foods, food] })
    //         })
    //     })
    // }
    
    render(){
        const {pets, foods, editPet, addPet, deletePet, addFood, editFoodAmount} = this.props

        return(
            <main>
                <Dogs editPet={editPet} addPet={addPet} deletePet={deletePet} pets={pets} addFood={addFood}/>
                <PetFood 
                foods={foods} 
                pets={pets} 
                deleteFood={this.deleteFood} 
                editFoodAmount={editFoodAmount}
            /> 
            </main>
        )
    }
}