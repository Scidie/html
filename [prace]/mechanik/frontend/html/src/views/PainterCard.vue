<script>
 import { ref } from 'vue'
 import util from "@/util";

 export default {
  name: 'PainterCard',
  setup() {

   //example array consisting of all the information about colors, assigned indexes and if it is selected or not (active/inactive status), has to be replaced with real-life data
   let array = [
       {rgb: "rgb(112,155,102)", index: "10", status: "inactive"},
     {rgb: "rgb(155, 102, 102)", index: "20", status: "inactive"},
     {rgb: "rgb(102,155,149)", index: "30", status:"inactive"},
     {rgb: "rgb(155,154,102)", index: "40", status: "inactive"},
     {rgb: "rgb(136,102,155)", index: "50", status: "inactive"},
     {rgb: "rgb(155,125,102)", index: "60", status:"inactive"},
     {rgb: "rgb(127,102,155)", index: "70", status: "inactive"},
     {rgb: "rgb(129,155,102)", index: "80", status: "inactive"},
     {rgb: "rgb(102,117,155)", index: "90", status:"inactive"},
     {rgb: "rgb(112,155,102)", index: "10", status: "inactive"},
     {rgb: "rgb(155, 102, 102)", index: "20", status: "inactive"},
     {rgb: "rgb(102,155,149)", index: "30", status:"inactive"},
     {rgb: "rgb(155,154,102)", index: "40", status: "inactive"},
     {rgb: "rgb(136,102,155)", index: "50", status: "inactive"},
     {rgb: "rgb(155,125,102)", index: "60", status:"inactive"},
     {rgb: "rgb(127,102,155)", index: "70", status: "inactive"},
     {rgb: "rgb(129,155,102)", index: "80", status: "inactive"},
     {rgb: "rgb(102,117,155)", index: "90", status:"inactive"}]

   //copy of the array with a changed number of fields in one row
   let colors = createAndArrangeArray(array, 5)
   let position = ref({row: 1, column: 1})
   let selectedColorData = colors.value[position.value.row][position.value.column].index
   colors.value[position.value.row][position.value.column].status = "active"



   //handling submitting choosing the color by pressing "Enter" button
   document.addEventListener("keydown", e => {
    if (e.key === "Enter") {
     updateSelectedColorData()
     console.log(selectedColorData)

     util.sendNUI("submitPainter", {
       text: selectedColorData
     })
    }
   })

   document.addEventListener("keydown", e => {
    if (e.key === "w" || e.key === "ArrowUp") {
     if (position.value.row > 0) {
      colors.value[position.value.row][position.value.column].status = "inactive"
      position.value.row -= 1
      colors.value[position.value.row][position.value.column].status = "active"
     }
    }
    else if (e.key === "s" || e.key === "ArrowDown") {
     if (position.value.row < colors.value.length - 1 && colors.value[position.value.row + 1][position.value.column] !== undefined) {
      colors.value[position.value.row][position.value.column].status = "inactive"
      position.value.row += 1
      colors.value[position.value.row][position.value.column].status = "active"
     }
    }
    else if (e.key === "a" || e.key === "ArrowLeft") {
     if (position.value.column > 0) {
      colors.value[position.value.row][position.value.column].status = "inactive"
      position.value.column -= 1
      colors.value[position.value.row][position.value.column].status = "active"
     }
    }
    else if (e.key === "d" || e.key === "ArrowRight") {
     if (position.value.column < colors.value[0].length - 1 && colors.value[position.value.row][position.value.column + 1] !== undefined) {
      colors.value[position.value.row][position.value.column].status = "inactive"
      position.value.column += 1
      colors.value[position.value.row][position.value.column].status = "active"
     }
    }
   })

   function updateSelectedColorData() {
    selectedColorData = colors.value[position.value.row][position.value.column].index
   }

   function createAndArrangeArray(array, numberOfFieldsInRow) {
    let arrangedArray = ref([])
    let counter = 0
    let numberOfRow = 0
    let arrayLength = array.length
    while(counter < arrayLength) {
     arrangedArray.value.push([])
     for (let i = 0; i < numberOfFieldsInRow; i++) {
      if (counter < arrayLength) {
       arrangedArray.value[numberOfRow].push(array[counter])
       counter++
      }
     }
     numberOfRow++
    }

    return arrangedArray
   }

   function handleClick (element, row, column) {
    colors.value[position.value.row][position.value.column].status = "inactive"
    position.value = {row, column}
    colors.value[position.value.row][position.value.column].status = "active"
    updateSelectedColorData()
   }

   return {
      position, selectedColorData, handleClick, array, colors
   }
  }
 }
</script>

<template>
 <div>

  <div id="color-palette">
   <div v-for="(row, indexOfRow) in colors" :key="row.length">
    <div class="row">
     <div class="container" v-for="(element, indexOfColumn) in row" :key="element.length">
      <div :id=element.index class="color-pole" :class=element.status :style="{ background: element.rgb}" @click="handleClick(element, indexOfRow, indexOfColumn)"></div>
     </div>
    </div>
   </div>
  </div>


  <div id="index-display">Index of the chosen color is: {{colors[position.row][position.column].index}}</div>

 </div>




</template>

<style scoped>
* {
  box-sizing: border-box;
}

#color-palette {
  padding: 20px;
 }

.container {
  display: inline-block;
  width: auto;
  margin: 0px;
  padding: 0px;
}

.color-pole {
  width: 80px;
  height: 80px;
}

.row {
  display: flex;
  align-items: flex-start;
  justify-content: flex-start;
  padding: 0;
  margin: 0;
}

#index-display {
  font-size: 35px;
  text-align: left;
}

.active {
  border: dotted orange 5px;
}
</style>
