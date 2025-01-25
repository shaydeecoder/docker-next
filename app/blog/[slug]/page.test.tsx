/**
 * @jest-environment jsdom
 */
import { render, screen, waitFor } from "@testing-library/react";
import "@testing-library/jest-dom";
import Page from "./page";

it("App Router: Works with dynamic route segments", async () => {
  const params = Promise.resolve({ slug: "Test" });
  render(<Page params={params} />);

  await waitFor(() => {
    expect(screen.getByRole("heading")).toHaveTextContent("Slug: Test");
  });
});
