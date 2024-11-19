import { useState } from "react";
import "./App.css";
import BackgroundHeading from "./components/BackgroundHeading";
import Footer from "./components/Footer";
import Header from "./components/Header";
import ItemList from "./components/ItemList";
import Sidebar from "./components/Sidebar";
import { initialItems } from "./constants";
import Counter from "./components/Counter";

function App() {
  const [items, setItems] = useState(initialItems);

  const handleAddItem = (itemText) => {
    const newItem = {
      id: new Date().getTime(),
      name: itemText,
      packed: false,
    };
    const newItems = [...items, newItem];
    setItems(newItems);
  };

  const handleDeleteItem = (id) => {
    const newItems = items.filter((item) => item.id !== id);
    setItems(newItems);
  };

  const handleToggleItem = (id) => {
    const newItems = items.map((item) => {
      if (item.id == id) {
        return { ...item, packed: !item.packed };
      } else {
        return item;
      }
    });
    setItems(newItems);
  };

  const handleRemoveAllItems = () => {
    setItems([]);
  };

  const handleResettoInitial = () => {
    setItems(initialItems);
  };

  const handleMarkAllAsComplete = () => {
    const newItems = items.map((item) => {
      return { ...item, packed: true };
    });

    setItems(newItems);
  };

  const handleMarkAllAsIncomplete = () => {
    const newItems = items.map((item) => {
      return { ...item, packed: false };
    });

    setItems(newItems);
  };

  const sidebarHandlers = {
    handleRemoveAllItems: handleRemoveAllItems,
    handleResettoInitial: handleResettoInitial,
    handleMarkAllAsComplete: handleMarkAllAsComplete,
    handleMarkAllAsIncomplete: handleMarkAllAsIncomplete,
  };

  return (
    <>
      <BackgroundHeading />

      <main>
        <Header>
          <Counter
            checkedValue={items.filter((item) => item.packed == true).length}
            totalValue={items.length}
          />
        </Header>
        <ItemList
          items={items}
          handleDeleteItem={handleDeleteItem}
          handleToggleItem={handleToggleItem}
        />
        <Sidebar
          handleAddItem={handleAddItem}
          sidebarHandlers={sidebarHandlers}
        />
      </main>

      <Footer />
    </>
  );
}

export default App;
