// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

document.addEventListener("turbo:load", function () {
  // Initialisation de flatpickr sur le champ avec l'id "arrival-picker"
  flatpickr("#arrival-picker", {
    enableTime: true,
    locale: "fr",                // Localisation en français
    time_24hr: true,             // Format 24h
    dateFormat: "Y-m-d H:i",     // Format pour inclure la date et l'heure
    minDate: new Date().fp_incr(3), // Empêche la sélection des dates avant 3 jours
    minuteIncrement: 30,         // Incréments de 30 minutes
    disable: [
      function (date) {
        // Désactive certains jours, par exemple, dimanches
        return [0, 1, 2, 3].includes(date.getDay());
      }
    ]
  });
});
