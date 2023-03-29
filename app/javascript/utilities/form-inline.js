document.addEventListener('turbolinks:load', function () {
    $('.form-inline-link').on('click', formInlineLinkHandler)

    const errors = document.querySelector('.resource-errors')

    if (errors) {
        let resourceId = errors.dataset.resourceId
        formInlineHandler(resourceId)
    }
})

function formInlineLinkHandler(event) {
    event.preventDefault()
    const testId = this.dataset.testId
    console.log(testId)
    formInlineHandler(testId)

}

function formInlineHandler(testId) {
    let $link = $(`.form-inline-link[data-test-id="${testId}"]`)
    if ($link) {
        let $testTitle = $(`.test-title[data-test-id="${testId}"]`)
        let $formInline = $(`.form-inline[data-test-id="${testId}"]`)

        $formInline.toggle()
        $testTitle.toggle()

        if ($formInline.is(':visible')) {
            $link.text('Cancel')
        } else {
            $link.text('Edit')
        }
    }
}