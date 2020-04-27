<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="card_drag.aspx.cs" Inherits="_365_Portal.t.card_drag" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        .board {
            position: relative;
            margin-left: 1%;
        }

        .board-column {
            position: absolute;
            left: 0;
            /*right: 0;*/
            width: 30%;
            margin: 0 1.5%;
            background: #f0f0f0;
            border-radius: 3px;
            z-index: 1;
        }

            .board-column.muuri-item-releasing {
                z-index: 2;
            }

            .board-column.muuri-item-dragging {
                z-index: 3;
                cursor: move;
            }

        .board-column-header {
            position: relative;
            height: 50px;
            line-height: 50px;
            overflow: hidden;
            padding: 0 20px;
            text-align: center;
            background: #333;
            color: #fff;
            border-radius: 3px 3px 0 0;
        }

        @media (max-width: 600px) {
            .board-column-header {
                text-indent: -1000px;
            }
        }

        .board-column.todo .board-column-header {
            background: #4A9FF9;
        }

        .board-column.working .board-column-header {
            background: #f9944a;
        }

        .board-column.done .board-column-header {
            background: #2ac06d;
        }
        /* This is the secret sauce,
   always use a wrapper for setting
   the "overflow: scroll/auto" */
        .board-column-content-wrapper {
            position: relative;
            max-height: 300px;
            overflow-y: auto;
        }
        /* Never ever set "overflow: auto/scroll"
   to the muuri element, stuff will break */
        .board-column-content {
            position: relative;
            border: 10px solid transparent;
            min-height: 95px;
        }

        .board-item {
            position: absolute;
            width: 100%;
            margin: 5px 0;
        }

            .board-item.muuri-item-releasing {
                z-index: 9998;
            }

            .board-item.muuri-item-dragging {
                z-index: 9999;
                cursor: move;
            }

            .board-item.muuri-item-hidden {
                z-index: 0;
            }

        .board-item-content {
            position: relative;
            padding: 20px;
            background: #fff;
            border-radius: 4px;
            font-size: 17px;
            cursor: pointer;
            -webkit-box-shadow: 0px 1px 3px 0 rgba(0,0,0,0.2);
            box-shadow: 0px 1px 3px 0 rgba(0,0,0,0.2);
        }

        @media (max-width: 600px) {
            .board-item-content {
                text-align: center;
            }

                .board-item-content span {
                    display: none;
                }
        }
    </style>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/web-animations/2.3.1/web-animations.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/hammer.js/2.0.8/hammer.min.js"></script>
    <script src="https://unpkg.com/muuri@0.6.3/dist/muuri.min.js"></script>

</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div id="dvBoard" class="board">
                <%-- <div class="board-column todo">
                    <div class="board-column-header">To do</div>
                    <div class="board-column-content-wrapper">
                        <div class="board-column-content">
                            <div class="board-item">
                                <div class="board-item-content"><span>Item #</span>1</div>
                            </div>
                            <div class="board-item">
                                <div class="board-item-content"><span>Item #</span>2</div>
                            </div>
                            <div class="board-item">
                                <div class="board-item-content"><span>Item #</span>3</div>
                            </div>
                            <div class="board-item">
                                <div class="board-item-content"><span>Item #</span>4</div>
                            </div>
                            <div class="board-item">
                                <div class="board-item-content"><span>Item #</span>5</div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="board-column working">
                    <div class="board-column-header">Working</div>
                    <div class="board-column-content-wrapper">
                        <div class="board-column-content">
                            <div class="board-item">
                                <div class="board-item-content"><span>Item #</span>6</div>
                            </div>
                            <div class="board-item">
                                <div class="board-item-content"><span>Item #</span>7</div>
                            </div>
                            <div class="board-item">
                                <div class="board-item-content"><span>Item #</span>8</div>
                            </div>
                            <div class="board-item">
                                <div class="board-item-content"><span>Item #</span>9</div>
                            </div>
                            <div class="board-item">
                                <div class="board-item-content"><span>Item #</span>10</div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="board-column done">
                    <div class="board-column-header">Done</div>
                    <div class="board-column-content-wrapper">
                        <div class="board-column-content">
                            <div class="board-item">
                                <div class="board-item-content"><span>Item #</span>11</div>
                            </div>
                            <div class="board-item">
                                <div class="board-item-content"><span>Item #</span>12</div>
                            </div>
                            <div class="board-item">
                                <div class="board-item-content"><span>Item #</span>13</div>
                            </div>
                            <div class="board-item">
                                <div class="board-item-content"><span>Item #</span>14</div>
                            </div>
                            <div class="board-item">
                                <div class="board-item-content"><span>Item #</span>15</div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="board-column done">
                    <div class="board-column-header">one more</div>
                    <div class="board-column-content-wrapper">
                        <div class="board-column-content">
                            <div class="board-item">
                                <div class="board-item-content"><span>Item #</span>11</div>
                            </div>
                            <div class="board-item">
                                <div class="board-item-content"><span>Item #</span>12</div>
                            </div>
                            <div class="board-item">
                                <div class="board-item-content"><span>Item #</span>13</div>
                            </div>
                            <div class="board-item">
                                <div class="board-item-content"><span>Item #</span>14</div>
                            </div>
                            <div class="board-item">
                                <div class="board-item-content"><span>Item #</span>15</div>
                            </div>
                        </div>
                    </div>
                </div>--%>
            </div>
        </div>
    </form>
    <script src="../includes/Asset/js/jquery.min.js"></script>
    <script type="text/javascript">

        $(document).ready(function () {
            var cards = ["Card 1", "Card 2", "Card 3", "Card 4"];
            var taskList = ["Task 1", "Task 3", "Task 4", "Task 5"];
            var cardHtml = "";
            $.each(cards, function (card, cardIndex) {
                cardHtml += '  <div class="board-column">';
                cardHtml += '   <div class="board-column-header">' + card + '</div>';
                cardHtml += '    <div class="board-column-content-wrapper">';
                cardHtml += '      <div class="board-column-content">';
                $.each(cards, function (task, taskIndex) {
                    cardHtml += '<div class="board-item">';
                    cardHtml += '<div class="board-item-content"><span>' + card + ' -  Item #</span>' + taskIndex + '</div>';
                    cardHtml += ' </div>';
                });
                cardHtml += ' </div>';
                cardHtml += ' </div>';
                cardHtml += ' </div>';
                cardHtml += ' </div>';
            });
            $("#dvBoard").html(cardHtml);

            InitializeCardsDraggableView();

        });

        function InitializeCardsDraggableView() {
            var itemContainers = [].slice.call(document.querySelectorAll('.board-column-content'));
            var columnGrids = [];
            var boardGrid;

            // Define the column grids so we can drag those
            // items around.
            itemContainers.forEach(function (container) {
                // Instantiate column grid.
                var grid = new Muuri(container, {
                    items: '.board-item',
                    layoutDuration: 400,
                    layoutEasing: 'ease',
                    dragEnabled: true,
                    dragSort: function () {
                        return columnGrids;
                    },
                    dragSortInterval: 0,
                    dragContainer: document.body,
                    dragReleaseDuration: 400,
                    dragReleaseEasing: 'ease'
                })
                    .on('dragStart', function (item) {
                        // Let's set fixed widht/height to the dragged item
                        // so that it does not stretch unwillingly when
                        // it's appended to the document body for the
                        // duration of the drag.
                        item.getElement().style.width = item.getWidth() + 'px';
                        item.getElement().style.height = item.getHeight() + 'px';
                    })
                    .on('dragReleaseEnd', function (item) {
                        // Let's remove the fixed width/height from the
                        // dragged item now that it is back in a grid
                        // column and can freely adjust to it's
                        // surroundings.
                        item.getElement().style.width = '';
                        item.getElement().style.height = '';
                        // Just in case, let's refresh the dimensions of all items
                        // in case dragging the item caused some other items to
                        // be different size.
                        columnGrids.forEach(function (grid) {
                            grid.refreshItems();
                        });
                    })
                    .on('layoutStart', function () {
                        // Let's keep the board grid up to date with the
                        // dimensions changes of column grids.
                        boardGrid.refreshItems().layout();
                    });

                // Add the column grid reference to the column grids
                // array, so we can access it later on.
                columnGrids.push(grid);

            });

            // Instantiate the board grid so we can drag those
            // columns around.
            boardGrid = new Muuri('.board', {
                layoutDuration: 400,
                layoutEasing: 'ease',
                dragEnabled: true,
                dragSortInterval: 0,
                dragStartPredicate: {
                    handle: '.board-column-header'
                },
                dragReleaseDuration: 400,
                dragReleaseEasing: 'ease'
            });
        }

        function AddMore() {
            var cards = ["Card 1", "Card 2", "Card 3", "Card 4"];
            var taskList = ["Task 1", "Task 3", "Task 4", "Task 5"];
            var cardHtml = "";
            $.each(cards, function (card, cardIndex) {
                cardHtml += '  <div class="board-column">';
                cardHtml += '   <div class="board-column-header">' + card + '</div>';
                cardHtml += '    <div class="board-column-content-wrapper">';
                cardHtml += '      <div class="board-column-content">';
                $.each(cards, function (task, taskIndex) {
                    cardHtml += '<div class="board-item">';
                    cardHtml += '<div class="board-item-content"><span>' + card + ' -  Item #</span>' + taskIndex + '</div>';
                    cardHtml += ' </div>';
                });
                cardHtml += ' </div>';
                cardHtml += ' </div>';
                cardHtml += ' </div>';
                cardHtml += ' </div>';
            });
            $("#dvBoard").html(cardHtml);
            InitializeCardsDraggableView();
        }

    </script>
</body>
</html>
