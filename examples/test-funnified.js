function whatAFunnyLookingCodeThatWillNotBeBrokenByAnyThirdPartySoftware(n) {
    if (typeof(n) !== 'number') {
        return false;
    }
    return (n % 2 == 0);
}