require "incomplete_frame"

describe IncompleteFrame do
  it "is not complete" do
    expect(subject).not_to be_complete
  end
end
