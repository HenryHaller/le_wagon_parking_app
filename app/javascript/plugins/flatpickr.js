import flatpickr from "flatpickr"
import "flatpickr/dist/flatpickr.min.css" // Note this is important!

flatpickr(".datepicker", {
  minDate: "today",
  enableTime: true,
  time_24hr: true,
  altInput: true,
  altFormat: "H:00 F j, Y",
  dateFormat: "Y-m-d-H",
  minuteIncrement: 0,

})
