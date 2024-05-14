import React, { useEffect, useState } from 'react';
import { Text, StyleSheet, View, ScrollView, TouchableOpacity, Alert, ActivityIndicator} from 'react-native';
import { useRoute } from "@react-navigation/native";
import { Dropdown } from 'react-native-element-dropdown';

export default function EvalClassScreen(props) {
    const route = useRoute();
    const idInscription = route.params?.id;

    const matriculeVar = 2051798;

    const [evalData, setEvalData] = useState(null);
    const [classData, setClassData] = useState(null);
    const [sessionActData, setSessionActData] = useState(null);
    const [loading, setLoading] = useState(true);


    // Liens BD locale

    const urlEval = `http://192.168.56.1:3000/api/evaluations/inscription/${idInscription}`;
    const urlClass = `http://192.168.56.1:3000/api/cours/${matriculeVar}`;
    const urlSessionAct = `http://192.168.56.1:3000/api/sessionactuelle/${matriculeVar}`;


    // Liens BD remote
    /*
    const urlEval = `https://eduportail-69af4de32dad.herokuapp.com/api/evaluations/inscription/${idInscription}`;
    const urlClass = `https://eduportail-69af4de32dad.herokuapp.com/api/cours/${matriculeVar}`;
    const urlSessionAct = `https://eduportail-69af4de32dad.herokuapp.com/api/sessionactuelle/${matriculeVar}`;
    */

    useEffect(() => {
        fetchData(urlEval, setEvalData);
        fetchData(urlClass, setClassData);
        fetchData(urlSessionAct, setSessionActData);
    }, []);

    const fetchData = (url, setData) => {
        fetch(url)
            .then((resp) => {
                if (!resp.ok) {
                    throw new Error('Network response was not ok');
                }
                return resp.json();
            })
            .then((json) => setData(json))
            .catch((error) => console.error('Error fetching data:', error))
            .finally(() => setLoading(false));
    };

    const findSigle = () =>{
        for (let i = 0; i < (classData ? classData.length: 0); i++) {
            if((classData ? classData[i].idInscription: 0) == idInscription){
                return (classData ? classData[i].sigle: '');
            }
        }
    }

    const findTitre = () =>{
        for (let i = 0; i < (classData ? classData.length: 0); i++) {
            if((classData ? classData[i].idInscription: 0) == idInscription){
                return (classData ? classData[i].titreCours: '');
            }
        }
    }

    const backgroundColor = (percentage) => {
        if (percentage && percentage >= 60) {
            return '#ccffcc';
        } else {
            return '#ffcccc';
        }
    };

    const renderList = () => {
        const listItems = [];

        for (let i = 0; i < (evalData ? evalData.length : 0); i++) {
            const listItemBackgroundColor = backgroundColor(evalData ? evalData[i].notePourcentage : null);

            listItems.push(
                <View style={[styles.testListItems, { backgroundColor: listItemBackgroundColor }]} key={i}>
                    <Text style={styles.testDate}>{evalData ? evalData[i].datePublication.substring(0, 10) : ''}</Text>
                    <Text style={styles.evalType}>{evalData ? evalData[i].nomEvaluation : ''}</Text>
                    <Text style={styles.grade}>{evalData ? evalData[i].notePointage : ''}/{evalData ? evalData[i].pointage : ''} - {evalData ? evalData[i].notePourcentage : ''}%</Text>
                    <View style={styles.buttonContainer}>
                        {(evalData ? evalData[i].retroaction : null) != null ? (
                            <TouchableOpacity style={styles.retroButton} onPress={() => Alert.alert('Retroaction', evalData ? evalData[i].retroaction : '')}>
                                <Text style={styles.retroText}>Voir retro</Text>
                            </TouchableOpacity>
                        ) : (
                            <TouchableOpacity style={styles.retroButtonDisabled} disabled={true}>
                                <Text style={styles.retroText}>Voir retro</Text>
                            </TouchableOpacity>
                        )}
                    </View>
                </View>
            );
        }

        return listItems;
    };

    //Drop Down List
    const selectedSort = [
        { label: 'Date (plus recente)', value: '1' },
        { label: 'Date (plus ancienne)', value: '2' },
        { label: 'Note (plus elevee)', value: '3' },
        { label: 'Note (plus basse)', value: '4' },
    ];

    const [value, setValue] = useState(null);
    const [isFocus, setIsFocus] = useState(false);

    const pass = true;

    return (
        <View style={styles.mainContainer}>
            {loading ? (
                <ActivityIndicator />
            ) : (
            <View style={styles.container}>
                <Text style={styles.evalClassTitle}>
                    {/*change with selected class (filter)*/}
                    <Text style={styles.titleID}>{findSigle()}</Text>
                    <Text> - {findTitre()}</Text>
                </Text>

                <View style={styles.classInfoContainer}>
                    <Text style={{fontSize: 18}}>Session: {sessionActData ? sessionActData.nomSession : ''}</Text>
                    <Text style={{fontSize: 18}}>Enseignant: Joel Boudreau</Text>
                </View>

                <View style={styles.filterContainer}>
                    <Text>Trier par</Text>
                    <Dropdown
                        style={[styles.dropdown, isFocus && { borderColor: 'blue' }]}
                        placeholderStyle={styles.placeholderStyle}
                        selectedTextStyle={styles.selectedTextStyle}
                        inputSearchStyle={styles.inputSearchStyle}
                        data={selectedSort}
                        labelField="label"
                        valueField="value"
                        placeholder={!isFocus ? 'Select item' : '...'}
                        searchPlaceholder="Search..."
                        value={value}
                        onFocus={() => setIsFocus(true)}
                        onBlur={() => setIsFocus(false)}
                        onChange={item => {
                            setValue(item.value);
                            setIsFocus(false);
                        }}
                    />
                </View>

                <View style={styles.testsListContainer}>
                    <ScrollView style={styles.testsListScroll}>
                        {renderList()}
                    </ScrollView>
                </View>
            </View>
            )}
        </View>
    );
}

const styles = StyleSheet.create({
    //main Container
    mainContainer: {
        flex: 1,
        backgroundColor: '#e7eff6',
    },
    container: {
        flex: 1,
        alignItems: 'center',
        justifyContent: 'flex-end',
    },
    evalClassTitle: {
        fontSize: 25,
        textAlign: 'center',
        position: 'absolute',
        top: 15,
        width: '90%',
    },
    titleID: {
        fontSize: 35,
        fontWeight: 'bold',
    },
    classInfoContainer: {
        position: 'absolute',
        top: '20%',
        left: '6%',
    },
    filterContainer: {
        width: '85%',
        height: 60,
        borderRadius: 5,
        position: 'absolute',
        top: '30%',
    },
    dropdown: {
        height: 25,
        borderColor: 'gray',
        backgroundColor: 'white',
        borderWidth: 2,
        borderRadius: 8,
        paddingHorizontal: 8,
        marginTop: 5
    },
    testsListContainer: {
        position: 'absolute',
        top: '40%',
        left: '5%',
        width: '90%',
        height: '65%'
    },
    testsListScroll: {
        backgroundColor: 'white',
        borderRadius: 5,
    },
    testListItems: {
        flexDirection: 'row',
        backgroundColor: '#adcbe3',
        borderColor: '#2a4d69',
        height: 40,
        borderRadius: 5,
        borderWidth: 2,
        alignItems: 'center',
        justifyContent: 'space-between',
    },
    testDate: {
        flex: 1,
        textAlign: 'center',
        marginHorizontal: 5,
    },
    evalType: {
        flex: 1,
        textAlign: 'center',
        marginHorizontal: 5,
    },
    grade: {
        flex: 1,
        textAlign: 'center',
        marginHorizontal: 5,
    },
    buttonContainer: {
        flex: 1,
        marginHorizontal: 10,
    },
    retroButton: {
        backgroundColor: '#4b86b4',
        height: 20,
        width: 85,
        borderRadius: 5,
        justifyContent: 'center'
    },
    retroButtonDisabled: {
        backgroundColor: 'gray',
        height: 20,
        width: 85,
        borderRadius: 5,
        justifyContent: 'center'
    },
    retroText: {
        textAlign: 'center',
        color: 'white',
        fontWeight: 'bold',
    }
})