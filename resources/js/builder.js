import Sortable from "sortablejs";

document.addEventListener("livewire:navigated", initBuilder);
document.addEventListener("livewire:init", initBuilder);

function initBuilder() {
    const canvas = document.getElementById("builder-canvas");
    if (!canvas || canvas.dataset.initialized) {
        return;
    }

    canvas.dataset.initialized = true;

    Sortable.create(canvas, {
        animation: 150,
        handle: ".drag-handle",
        onEnd(event) {
            Livewire.dispatch("fieldMoved", {
                oldIndex: event.oldIndex,
                newIndex: event.newIndex,
            });
        },
    });
}
