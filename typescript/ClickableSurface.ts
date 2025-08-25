namespace Example {
    export class ClickableSurface extends XojoWeb.XojoVisualControl {
        constructor(id: string, events: string[]) {
            super(id, events);
            const el: HTMLElement | null = this.DOMElement('');
            if (!el) return;

            el.addEventListener('pointerup', (ev) => {
                const data = new XojoWeb.JSONItem();
                data.set('posX', ev.offsetX);
                data.set('posY', ev.offsetY);
                data.set('buttonIndex', ev.button);
                this.triggerServerEvent('pressed', data, false);
            });
        }

        updateControl(data: string) {
            super.updateControl(data);
            this.refresh();
        }

        render() {
            super.render();
            const el: HTMLElement | null = this.DOMElement('');
            if (!el) return;
            this.setAttributes(el);

            el.style.display = this.mEnabled && this.mVisible ? 'block' : 'none';

            this.applyTooltip(el);
            this.applyUserStyle(el);
        }
    }
}
