export default function Counter({ checkedValue, totalValue }) {
  return (
    <p>
      {totalValue == 0 ? (
        "Your list is empty"
      ) : (
        <>
          <b>{checkedValue}</b> / {totalValue} items packed
        </>
      )}
    </p>
  );
}
