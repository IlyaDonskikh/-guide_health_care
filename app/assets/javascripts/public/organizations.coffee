$ ->
  $('.organizations-index-filter__item__field__input-addressJS').change ->
    $(@).closest('form').trigger('submit')
  $('.organizations-index-filter__item__field__input-illnessJS').change ->
    $(@).closest('form').trigger('submit')