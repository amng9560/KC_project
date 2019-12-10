import React, {Component} from 'react';
import Navigation from '../Navigation';
import Home from '../Home'
import FoodBowl from '../FoodBowl'
import Food from '../Food'
import Login from '../Login'

export default class App extends Component {
    state = {
        currentPage: 'Home',
        user: false,
        token: null,
        pets: [],
        foods: []
    }

    switchPage = (clickedPage) => {
        this.setState({
            currentPage: clickedPage
        })
    }

    logInUser = (user, token) => {
        return (
            localStorage.getItem('authToken') === 'null'
                || localStorage.getItem('authToken') === 'undefined'
                    ? null
                    : this.setState({user, token})
        )
    }

    logOutUser = (event) => {
        event.preventDefault()
        this.setState({
            user: false,
            token: null
        })
    }

    fetchCall = (url, method, body) => {
        const headers = {
            "Content-Type": "application/json",
            "Authorization": `Bearer ${this.state.token}`
        }
        return fetch(url, {method, headers, body})
    }

    fetchPets = () => {
        // fetch(`http://localhost:3000/users/${this.state.user.id}/pets/`, {
        //     method: "GET",
        //     headers: {
        //         "Authorization": `Bearer ${this.state.token}`
        //     }
        // })
        this.fetchCall(`http://localhost:3000/users/${this.state.user.id}/pets/`, "GET")
            .then(response => response.json())
            .then(response => {
                this.setState({
                    pets: response.data,
                    foods: response.data.map(pet => {
                        const { foods } = pet.attributes
                        return foods
                    })
                })
        })
    }

    addPet = (pet) => {
        // this.setState({pets: [...this.state.pets, {attributes: {...pet}}]})
        const body = JSON.stringify({...pet, user_id: this.state.user.id})
        // return fetch(`http://localhost:3000/users/${this.state.user.id}/pets/`, {
        //     method: "POST",
        //     headers: {
        //         "Content-Type": "application/json",
        //         "Authorization": `Bearer ${this.state.token}`
        //     },
        //     body: JSON.stringify(body)
        // })
        return this.fetchCall(`http://localhost:3000/users/${this.state.user.id}/pets/`, "POST", body)
        .then(response => response.json())
        .then(pet => {
            this.setState({
                pets: [...this.state.pets, pet.data]
            })
        })
    }

    addFood = (foodWithPetId) => {
        // this.setState({foods: [...this.state.foods, [foodWithPetId]]})
        console.log(this.state.foods)
        const body = {...foodWithPetId}
        return fetch(`http://localhost:3000/foods/`, {
            method: "POST",
            headers: {
                "Content-Type": "application/json",
                "Authorization": `Bearer ${this.state.token}`
            },
            body: JSON.stringify(body)
        }).then(response => response.json())
        .then(food => {
            this.setState({foods: [...this.state.foods, [food]]})
        })
    }

    editPet = (updatedPet) => {
        const body = JSON.stringify({...updatedPet, user_id: this.state.user.id})
        const newState = this.state.pets.filter(pet => pet.id !== updatedPet.id)
        return fetch(`http://localhost:3000/users/${this.state.user.id}/pets/${updatedPet.id}`, {
            method: "PATCH",
            headers: {
                "Content-Type": "application/json",
                "Authorization": `Bearer ${this.state.token}`
            },
            body: JSON.stringify(body)
        }).then(response => response.json())
        .then(pet => {
            this.setState({
                pets: [...newState, {attributes: pet}]
            })
        })
    }

    editFoodAmount = (food) => {
        const data = {amount: food}
        return fetch(`http://localhost:3000/foods/${food.food_id}`, {
            method: "PATCH",
            headers: {
                "Content-Type": "application/json",
                "Authorization": `Bearer ${this.state.token}`
            },
            body: JSON.stringify(data)
        })
    }

    deleteFood = (id) => {
        const newState = this.state.foods.flat(Infinity).filter(f => f.id !== id)
        this.setState({foods: newState})
        fetch(`http://localhost:3000/foods/${id}`, {
            method: "DELETE",
            headers: {
                "Content-Type": "application/json",
                "Authorization": `Bearer ${this.state.token}`
            }
        })
    }

    deletePet = (id) => {
        const newState = this.state.pets.filter(p => p.id !== id)
        this.setState({pets: newState})
        fetch(`http://localhost:3000/pets/${id}`, {
            method: "DELETE",
            headers: {
                "Content-Type": "application/json",
                "Authorization": `Bearer ${this.state.token}`
            }
        })
    }

    render(){
        const pages = {
            "Home": <Home />,
            "Login": <Login 
                logInUser={this.logInUser} 
                logOutUser={this.logOutUser} 
                inUseUser={this.state.user} 
                fetchPets={this.fetchPets}
            />,
            "Food Bowl": <FoodBowl 
                pets={this.state.pets}
                foods={this.state.foods} 
                addPet={this.addPet} 
                editPet={this.editPet} 
                deletePet={this.deletePet}
                addFood={this.addFood}
                deleteFood={this.deleteFood}
                editFoodAmount={this.editFoodAmount}
            />,
            "Food List": <Food />
        }
        const {user} = this.state
        return(
            <div className="App">
                <Navigation 
                    switchPage={this.switchPage}
                    userLoggedIn={user}
                />
                {pages[this.state.currentPage]}
            </div>
        )
    }
}