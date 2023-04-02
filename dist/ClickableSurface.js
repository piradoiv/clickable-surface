"use strict";
var Example;
(function (Example) {
    class ClickableSurface extends XojoWeb.XojoVisualControl {
        constructor(id, events) {
            super(id, events);
            const el = this.DOMElement('');
            if (!el)
                return;
            el.addEventListener('pointerup', (ev) => {
                const data = new XojoWeb.JSONItem();
                data.set('posX', ev.offsetX);
                data.set('posY', ev.offsetY);
                this.triggerServerEvent('pressed', data, false);
            });
        }
        updateControl(data) {
            super.updateControl(data);
            this.refresh();
        }
        render() {
            super.render();
            const el = this.DOMElement('');
            if (!el)
                return;
            this.setAttributes(el);
            el.style.display = this.mEnabled && this.mVisible ? 'block' : 'none';
            this.applyTooltip(el);
            this.applyUserStyle(el);
        }
    }
    Example.ClickableSurface = ClickableSurface;
})(Example || (Example = {}));
