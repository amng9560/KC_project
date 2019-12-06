import React from 'react'
import Card from "../Card"
import './app.css'

export default ({foods, deleteFood, editFoodAmount}) => {
 
    function createCards(){
        foods.flat().map((food, i) => {
            console.log(food)
            return <Card key={i} data={food} deleteFood={deleteFood} editFoodAmount={editFoodAmount}/>
            })
        }

    return (
        <div className="foodContainer"> 
            <h1>Pet Food</h1>
            {createCards()}
        </div>
    )
}