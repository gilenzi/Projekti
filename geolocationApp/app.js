'use-strict';

const months = ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'];

const form = document.querySelector('.form');
const containerWorkouts = document.querySelector('.workouts');
const inputType = document.querySelector('.form__input--type');
const inputDistance = document.querySelector('.form__input--distance');
const inputDuration = document.querySelector('.form__input--duration');
const inputCadence = document.querySelector('.form__input--cadence');
const inputElevation = document.querySelector('.form__input--elevation');
const workoutsContainer = document.querySelector('.workouts');
const sortButton = document.querySelector('#sort');
const sortingForm = document.querySelector('.sorting-form');
const deleteAll = document.querySelector('.delete-all');
const km = document.querySelector('.edit-km');
const min = document.querySelector('.edit-min');
const spm = document.querySelector('.edit-spm');
const elevation = document.querySelector('.edit-elevation');
const overlay = document.querySelector('.overlay');
const sortContaienr = document.querySelector('.custom-select');

class App {

    #map;
    #mapEvent;
    #workouts = [];

    constructor() {
        // Displaying workout options if any exits
        if (this.#workouts.length > 0) {
            workoutOptions.classList.remove('hidden');
        }
        //Get users position
        this._getPosition();

        // Event handlers
        form.addEventListener('submit', this._newWorkout.bind(this));

        //change is event for section, is activated when option is changed
        inputType.addEventListener('change', this._toggleElevationField);

        // Listen for workout to be clicked(Show workout by COORDS)
        workoutsContainer.addEventListener('click', this._showWorkoutOnMap.bind(this));


        //Listen for workout options(Edit,Delete)
        // workoutOptions.addEventListener('click',this._workoutOptions.bind(this));

        // SORTING
        sortButton.addEventListener('change',this._sorting.bind(this));

    }
    
    _sorting(e){

        const allWorkouts = document.querySelectorAll('.workout');
        const sortObjects = (a,b) => a.value - b.value;
        let arr = this.#workouts;
        let sortType = sortButton.value;

        if(sortType === 'distance'){
            const sortingDesc = (a,b) =>{
                return a.distance - b.distance;
            }
            arr.sort(sortingDesc);
            handleSort.call(this);
        }   
        if(sortType === 'duration'){
            const sortingDesc = (a,b) =>{
                return a.duration - b.duration;
            }
            arr.sort(sortingDesc);
            handleSort.call(this);
        }   
        if(sortType === 'type'){
            const sortingDesc = (a,b) =>{
                //sort string ascending
                if (a.type < b.type) return -1 
                 
                if (a.type > b.type) return 1
                    
            }
            arr.sort(sortingDesc);
            handleSort.call(this);
        }   

        // Sorting by type of sort
        function handleSort(){
            // Deleting current list 
            allWorkouts.forEach(el => {
                el.remove();
            });;

            // Render workouts
            arr.forEach(work => {
                work.date = new Date(work.date);
                this._renderWorkout(work);
            });
        }
    }

    _getPosition() {
        if (navigator.geolocation) {
            navigator.geolocation.getCurrentPosition(
                this._loadMap.bind(this),
                function () {
                    alert('Could not get your position');
                });
        }
    }

    _loadMap(position) {
        const { latitude } = position.coords;
        const { longitude } = position.coords;
        const coords = [latitude, longitude];

        this.#map = L.map('map').setView(coords, 13);

        L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
            attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
        }).addTo(this.#map);

        //Get data from local storage (***IS POSITIONED HERE BECAUSE IN OTHER WAY MAP IS NOT LOADED ***)
        this._getLocalStorage();

        // Handling clicks on map
        this.#map.on('click', this._showForm.bind(this));

    }

    _showForm(mapE) {
        this.#mapEvent = mapE;
        form.classList.remove('hidden');
        workoutsContainer.classList.remove('hidden');
        inputDistance.focus();
    }

    _hideForm() {
        // Empty inputs
        inputCadence.value = inputDistance.value = inputDuration.value = inputElevation.value = '';
        form.style.display = 'none';
        form.classList.add('hidden');
        setTimeout(() => form.style.display = 'grid', 1000);
    }

    _toggleElevationField() {
        inputCadence.closest('.form__row').classList.toggle('form__row--hidden');
        inputElevation.closest('.form__row').classList.toggle('form__row--hidden');
    }

    _newWorkout(e) {

        const validInputs = (...inputs) => inputs.every(el => Number.isFinite(el));
        const allPosetive = (...inputs) => inputs.every(el => el > 0);

        // Displaying sorting
        sortContaienr.classList.remove('hidden');   

        e.preventDefault();

        // Get data from form
        const type = inputType.value
        const distance = +inputDistance.value;
        const duration = +inputDuration.value;
        const { lat, lng } = this.#mapEvent.latlng;
        let workout;

        // If workout running, create running object
        if (type === 'running') {
            const cadence = + inputCadence.value;
            // Check if data is valid
            if (
                !validInputs(distance, duration, cadence) ||
                !allPosetive(distance, duration, cadence)
            )
                return alert('Inputs have to be posetive numbers!');

            workout = new Running(distance, duration, [lat, lng], cadence);
        }
        // If workout cycling, create cycling object
        if (type === 'cycling') {
            const elevation = +inputElevation.value;
            // Check if data is valid
            if (
                !validInputs(distance, duration, elevation) ||
                !allPosetive(distance, duration)
            )
                return alert('Inputs have to be posetive numbers!');

            workout = new Cycling(distance, duration, [lat, lng], elevation);
        }

        // Add new object to workout array
        this.#workouts.push(workout);

        //Save workout to localstorage
        this._setLocalStorage();

        // Render workout on map as marker
        this._renderWorkoutMarker(workout);

        // Render workout on list
        this._renderWorkout(workout);

        // Hide form + clear input fields
        this._hideForm();

    }

    // Save workout to local storage
    _setLocalStorage() {
        localStorage.setItem('workouts', JSON.stringify(this.#workouts));
    }

    // Load workout data from Localstorage
    _getLocalStorage() {
        const data = JSON.parse(localStorage.getItem('workouts'));
     
        if (!data) return;
        // Displaying workout options if any exits
        if (data.length > 0) {
            sortContaienr.classList.remove('hidden');   
        }

        this.#workouts = data;

        this.#workouts.forEach(work => {
            work.date = new Date(work.date);
            this._renderWorkout(work);
            this._renderWorkoutMarker(work);
        });
    }

    _deleteAllWorkouts() {
        if (!confirm('Do you want to delete all workouts?')) return;
        workoutsContainer.classList.add('hidden');
        sortContaienr.classList.add('hidden');   
        localStorage.removeItem('workouts');
        location.reload();
    }

    _deleteWorkout(e) {
        const data = JSON.parse(localStorage.getItem('workouts'));

        const findWorkout = (element) => element.id === e.target.closest('.workout').dataset.id;
        const workoutIndex = data.findIndex(findWorkout);

        data.splice(workoutIndex, 1);

        this.#workouts = data;

        this._setLocalStorage();
        location.reload();
    }

    _workoutOptions(e) {
        e.preventDefault()
        if (e.target.dataset.option === 'delete') {

            alert('Choose workout you want to delete.')

            workoutsContainer.addEventListener('click', this._deleteWorkout.bind(this));
        }
        if (e.target.dataset.option === 'delete-all') {
            if (confirm('Do you want to delete all workouts?')) {
                this._deleteAllWorkouts();
            } else {
                return;
            }
        }
    }

    _editFormAppear(workoutObj) {

        const closeForm = document.querySelector('.close-edit-form');
        overlay.classList.remove('hidden');
        km.focus();

        if (workoutObj.type === 'running') {
            spm.classList.remove('edit-hidden');
            elevation.classList.add('edit-hidden');

            km.value = workoutObj.distance;
            min.value = workoutObj.duration;
            spm.value = workoutObj.cadence;
        }

        if (workoutObj.type === 'cycling') {
            spm.classList.add('edit-hidden');
            elevation.classList.remove('edit-hidden');

            km.value = workoutObj.distance;
            min.value = workoutObj.duration;
            elevation.value = workoutObj.elevation;
        }

        // HIDE OVERLAY
        closeForm.addEventListener('click', function (e) {
            e.stopPropagation();
            overlay.classList.add('hidden');
        });

        // HIDE OVERLAY
        document.addEventListener("keydown", function (e) {
            e.stopPropagation();
            if (e.keyCode === 27) {
                overlay.classList.add('hidden');
            }
        });

        // Deleting all workouts
        deleteAll.addEventListener('click', this._deleteAllWorkouts);

    }

    _editWorkout(e) {
        const data = JSON.parse(localStorage.getItem('workouts'));

        // const allPosetive = (...inputs) => inputs.every(el => el > 0);
        let arr = [];

        let workoutID = e.target.closest('.workout').dataset.id;
        let obj = data.find(el => el.id == workoutID);

        // DIsplay edit form
        this._editFormAppear(obj);

        const allPosetive = (...inputs) => inputs.every(el => el > 0);
        const allFilled = (...inputs) => inputs.every(el => el != '');

        document.addEventListener('keydown', function (e) {
            e.stopPropagation();
            // Function for findind index of object

            const findObject = (el) => el.id === workoutID;
            const allFill = (...inputs) => inpu


            if (e.keyCode === 13) {

                arr = [km.value, min.value, spm.value, elevation.value];

                if (
                    obj.type === 'running' &&
                    !allFilled(km.value, min.value, spm.value) ||
                    obj.type === 'cycling' &&
                    !allFilled(km.value, min.value, elevation.value)
                ) {
                    alert('Inputs must not be empty!');
                }
                else {
                    if (obj.type === 'running') {
                        obj.distance = arr[0];
                        obj.duration = arr[1]
                        obj.cadence = arr[2];
                        obj.pace = (arr[1] / arr[0]).toFixed(2);

                        data[data.findIndex(findObject)] = obj;
                    }
                    if (obj.type === 'cycling') {
                        obj.distance = arr[0];
                        obj.duration = arr[1]
                        obj.elevation = arr[3];
                        obj.speed = arr[0] / (arr[1] / 60);

                        data[data.findIndex(findObject)] = obj;
                    }

                    localStorage.setItem('workouts', JSON.stringify(data));
                    overlay.classList.add('hidden');
                    location.reload();
                    km.value = min.value = spm.value = elevation.value = '';

                }

            }
        });
    }

    //Showing individual workout on map by COORDS
    _showWorkoutOnMap(e) {
        e.stopPropagation();
        const workoutEl = e.target.closest('.workout');
        if (!workoutEl) return;
        const workout = this.#workouts.find(work => work.id === workoutEl.dataset.id);

        this.#map.setView(workout.coords, 13, {
            animate: true,
            pan: {
                duration: 1
            }
        })

        // LISTER FOR EDIT BUTTON CLICKED   
        if (e.target.classList.contains('edit-btn')) {
            this._editWorkout(e);
        }

        // LISTEN FOR DELETE BUTTON CLICKED
        if (e.target.classList.contains('delete-btn')) {
            if (confirm('Do you want delete this workout?'))
                this._deleteWorkout(e);
            else return
        }

        //This feature is disabled because proto is lost in localStorage
        //    workout.click();
    }

    _renderWorkout(workout) {
        let html = `
        <li class="workout workout--${workout.type}" data-id=${workout.id}>
        <i class="fas fa-edit edit-btn"></i>
        <i class="fas fa-times-circle delete-btn"></i>
        <h2 class="workout__title">${workout.type[0].toUpperCase() + workout.type.slice(1)} on ${months[workout.date.getMonth()]} ${workout.date.getDate()}</h2>
        <div class="workout__details">
            <span class="workout__icon">${workout.type === 'running' ? '🏃‍♂️' : '🚴‍♂️'}</span>
            <span class="workout__value">${workout.distance}</span>
            <span class="workout__unit">KM</span>
        </div>
        <div class="workout__details">
          <span class="workout__icon">⏱</span>
          <span class="workout__value">${workout.duration}</span>
          <span class="workout__unit">MIN</span>
        </div>
      `;

        if (workout.type === 'running') {
            html += `
        <div class="workout__details">
            <span class="workout__icon">⚡</span>
            <span class="workout__value">${workout.pace}</span>
            <span class="workout__unit">MIN/KM</span>
        </div>
        <div class="workout__details">
            <span class="workout__icon">🦶</span>
            <span class="workout__value">${workout.cadence}</span>
            <span class="workout__unit">SPM</span>
        </div>
        </li>`;
        }
        if (workout.type === 'cycling') {
            html += `
        <div class="workout__details">
            <span class="workout__icon">⚡</span>
            <span class="workout__value">${workout.speed.toFixed(2)}</span>
            <span class="workout__unit">MIN/KM</span>
        </div>
        <div class="workout__details">
            <span class="workout__icon">🗻</span>
            <span class="workout__value">${workout.elevation}</span>
            <span class="workout__unit">M</span>
        </div>
        </li>`;
        }


        workoutsContainer.insertAdjacentHTML('beforeend', html);
    }

    _renderWorkoutMarker(workout) {
        const marketContent = `
            ${workout.type === 'running' ? '🏃‍♂️' : '🚴‍♂️'}
            ${workout.type === 'running' ? 'Running' : 'Cycling'} 
            on
            ${months[workout.date.getMonth()] + ' ' + workout.date.getDate()}
        `;
        L.marker(workout.coords)
            .addTo(this.#map)
            .bindPopup(L.popup({
                maxWidth: 250,
                minWidth: 100,
                autoClose: false,
                closeOnClick: false,
                className: `${workout.type}-popup`
            }))
            .setPopupContent(marketContent)
            .openPopup();
    }

    reset() {
        localStorage.removeItem('workouts');
        location.reload();
    }
}

const app = new App();

// app._newWorkout();

class Workout {
    id = (Date.now() + '').slice(-10);
    date = new Date();
    clicks = 0;

    constructor(distance, duration, coords) {
        this.distance = distance; // in km
        this.duration = duration; // in min
        this.coords = coords; // [lat, lng]
    }

    click() {
        this.clicks++;
    }
}

class Running extends Workout {
    type = 'running';

    constructor(distance, duration, coords, cadence) {
        super(distance, duration, coords);
        this.cadence = cadence;
        this.calcPace();
    }

    calcPace() {
        // min /km 
        this.pace = (this.duration / this.distance).toFixed(2);
        return this.pace;
    }
}

class Cycling extends Workout {
    type = 'cycling';

    constructor(distance, duration, coords, elevation) {
        super(distance, duration, coords);
        this.elevation = elevation;
        this.calcSpeed();
    }

    calcSpeed() {
        this.speed = this.distance / (this.duration / 60);
        return this.speed;
    }
}
/////////////////////////////////////////////////////////////////////////
// const run1 = new Running(20,40,[44.8808135,20.2011792],178);
// const cycle1 = new Cycling(28,50,[44.8808135,20.2011792],523);
// console.log(run1,cycle1);


