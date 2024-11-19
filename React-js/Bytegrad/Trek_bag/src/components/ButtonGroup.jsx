import { secondaryButtons } from "../constants";
import Button from "./Button";

export default function ButtonGroup({ actions }) {
  const secondaryButtonsO = [
    {
      text: secondaryButtons[0],
      onClick: actions.handleMarkAllAsComplete,
    },
    {
      text: secondaryButtons[1],
      onClick: actions.handleMarkAllAsIncomplete,
    },
    {
      text: secondaryButtons[2],
      onClick: actions.handleResettoInitial,
    },
    {
      text: secondaryButtons[3],
      onClick: actions.handleRemoveAllItems,
    },
  ];

  return (
    <section className="button-group">
      {secondaryButtonsO.map((button) => {
        return (
          <Button
            key={button.text}
            buttonType="secondary"
            onClick={button.onClick}
          >
            {button.text}
          </Button>
        );
      })}
    </section>
  );
}
