import { useState } from "react";
import "./App.css";

function App() {
    const [widgets, setWidgets] = useState<string[]>([]);

    function handleOnDrag(e: React.DragEvent, widgetType: string){
        e.dataTransfer.setData("widgetType", widgetType);
    }

    function handleOnDrop(){
        const widgetType = e.dataTransfer.getData("widgetType") as string;
        console.log("widgetType", widgetType);
        setWidgets([...widgets,widgetType]);
    }

    function handleDragOver(e: React.DragEvent){
        e.preventDefault();
    }

    return (
        <div className = "App">
            <div className = "widgets">
                <div 
                    className = "widget"
                    draggable
                    onDragStart={(e) => handleOnDrag(e, "CPU")}
                    >
                     CPU 
                    </div>
                    <div 
                    className = "widget"
                    draggable
                    onDragStart={(e) => handleOnDrag(e, "RAM")}
                    >
                     RAM
                    </div>
                    <div 
                    className = "widget"
                    draggable
                    onDragStart={(e) => handleOnDrag(e, "GPU")}
                    >
                    GPU
                    </div>
            </div>
            <div className="page" onDrop={handleOnDrop} onDragOver={handleDragOver}>
                {widgets.map((widget, index) => (
                    <div className="dropped-widget" key={index}>
                        {widget}
                    </div>        
                ))}
           </div> 
        </div>
    );

}

export default App;
