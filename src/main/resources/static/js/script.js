import React from "react";
import MDEditor from '@uiw/react-md-editor';
import * as ReactDOM from "react-dom";

// export default function App() {
//     const [value, setValue] = React.useState("**Hello world!!!**");
//     return (
//         <div className="container">
//             <MDEditor
//                 value={value}
//                 onChange={setValue}
//             />
//             <MDEditor.Markdown source={value} />
//         </div>
//     );
// }
//
const myHTML = `<h1>John Doe</h1>`;

const App = () => <div>{myHTML}</div>;
function getMark(text) {
    let converter = new showdown.Converter();
    converter.setFlavor('github');
    $('#text').append(converter.makeHtml($('#test').text()));
}