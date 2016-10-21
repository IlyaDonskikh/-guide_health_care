$ ->
  $('.organizations-index-filter__item__field__inputJS').change ->
    $(@).closest('form').trigger('submit')